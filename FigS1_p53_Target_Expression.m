%% Description
% This MATLAB program aims to simulate the mathematical model of the
% p53-Mdm2 system proposed by L. Xiong and A. Garfinkel, to evaluate the
% expression profiles of representative p53 targets (Fig. S1).

function main
%% Baseline parameters for the p53-Mdm2 system
alpha = 0.4; 
beta = 4;
gamma = 0.01;
sigma = 0.45;
kappa = 1;
epsilon = 0.7;
phi = 1.6;
delta = 0.75;

%% Baseline parameters for p21
Psi_1 = 0.45;
h_1 = 1;
K_1 = 1;
Gamma_1 = 0.5;
Phi_1 = 1.2;
Delta_1 = 0.25;

%% Baseline parameters for PUMA
Psi_2 = 0.45;
h_2 = 1;
K_2 = 1;
Gamma_2 = 1.5;
Phi_2 = 0.32;
Delta_2 = 0.06;

%% Modify parameter below for altered conditions
Psi_1 = 0.45/2; % Fig. S1A

% sigma = 0.01; % Fig. S1B
% Psi_1 = 0.01; % Fig. S1B
% Psi_2 = 0.01; % Fig. S1B
% Psi_3 = 0.01; % Fig. S1B
% Psi_4 = 0.01; % Fig. S1B

% delta = 0.25; % Fig. S1C
% beta = 16; % Fig. S1C
% sigma = 0.45*2; % Fig. S1D

%% Set parameter vector
P=[alpha, beta, gamma, sigma, kappa, epsilon, phi, delta, Psi_1, h_1, K_1, Gamma_1, Phi_1, Delta_1, Psi_2, h_2, K_2, Gamma_2, Phi_2, Delta_2];

%% Set initial conditions
Xo=[0.1, 0.06, 0.13, 0.01, 0.05, 0.01, 0.05]; 
% [p53]_i, [MDM2 transcript]_i, [Mdm2]_i, 
% [p21 transcript]_i, [p21]_i,
% [PUMA transcript]_i, [PUMA]_i

%% ODE calls
tspan=0:.1:48;
% options=odeset('RelTol',1e-6);
sol=ode15s(@(t,x) eqn(t,x,P), tspan, Xo);
xint=deval(sol,tspan);
x_p53=xint(1,:);
x_mdm2=xint(2,:); 
x_Mdm2=xint(3,:); 
x_p21_m=xint(4,:);
x_p21=xint(5,:);
x_PUMA_m=xint(6,:);
x_PUMA=xint(7,:);

%% plots
figure; 
plot(tspan,x_p53,tspan,x_PUMA,tspan,x_p21,'LineWidth',5)
xlabel('Time (hr)'); ylabel('Simulated concentration') 
legend('p53','PUMA','p21')
ylim([0 0.4])

return

function [dx_dt]=eqn(t,x,p) % Definition of the ODE system
  dx_dt = zeros(7,1);
  dx_dt(1) = p(1) - p(2)*x(3)*(x(1)/(p(3) + x(1))); % p53
  dx_dt(2) = p(4)*(x(1)/(p(5) + x(1))) - p(6)*x(2);
  dx_dt(3) = p(7)*x(2) - p(8)*x(3); % Mdm2
  dx_dt(4) = p(9)*(x(1)^p(10)/(p(11)^p(10) + x(1)^p(10))) - p(12)*x(4);
  dx_dt(5) = p(13)*x(4) - p(14)*x(5); % p21
  dx_dt(6) = p(15)*(x(1)^p(16)/(p(17)^p(16) + x(1)^p(16))) - p(18)*x(6);
  dx_dt(7) = p(19)*x(6) - p(20)*x(7); % PUMA
return