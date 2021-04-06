%% Description
% This MATLAB program aims to simulate the mathematical model of the
% p53-Mdm2 system proposed by L. Xiong and A. Garfinkel, to evaluate the
% expression profiles of representative p53 targets (Fig. 1D; Fig. S1-2).

function main
%% parameters for the p53-Mdm2 system
alpha = 0.4; 
beta = 4;
gamma = 0.01;
sigma = 0.45;
kappa = 1;
epsilon = 0.7;
phi = 1.6;
delta = 0.75;

%% parameters for p21
Psi_1 = 0.45;
h_1 = 1;
K_1 = 1;
Gamma_1 = 0.5;
Phi_1 = 1.2;
Delta_1 = 0.25;

%% parameters for PUMA
Psi_2 = 0.45;
h_2 = 1;
K_2 = 1;
Gamma_2 = 1.5;
Phi_2 = 0.32;
Delta_2 = 0.06;

%% parameters for EGFR
Psi_3 = 0.05;
h_3 = 1;
K_3 = 2;
Gamma_3 = 0.02;
Phi_3 = 0.2;
Delta_3 = 0.15;

%% parameters for the cryptic target (CT)
Psi_4 = 0.05;
h_4 = 2;
K_4 = 4;
Gamma_4 = 0.02;
Phi_4 = 0.1;
Delta_4 = 0.05;

%% modify parameter below
% alpha = 0.2; % Fig. 1D (middle panel)
% beta = 1; % Fig. 1D (right panel); Fig. S2C
% Psi_1 = 0.45/2; % Fig. S1A

% sigma = 0.01; % Fig. S1B; Fig. S2C
% Psi_1 = 0.01; % Fig. S1B; Fig. S2C
% Psi_2 = 0.01; % Fig. S1B; Fig. S2C
% Psi_3 = 0.01; % Fig. S1B; Fig. S2C
% Psi_4 = 0.01; % Fig. S1B; Fig. S2C

% delta = 0.25; % Fig. S1C
% beta = 16; % Fig. S1C
% sigma = 0.45*2; % Fig. S1D

% sigma = 0.45/5; % Fig. S2B
% Psi_1 = 0.45/5; % Fig. S2B
% Psi_2 = 0.45/5; % Fig. S2B
% Psi_3 = 0.05/5; % Fig. S2B
% Psi_4 = 0.05/5; % Fig. S2B

%% set parameter vector
P=[alpha, beta, gamma, sigma, kappa, epsilon, phi, delta, Psi_1, h_1, K_1, Gamma_1, Phi_1, Delta_1, Psi_2, h_2, K_2, Gamma_2, Phi_2, Delta_2, Psi_3, h_3, K_3, Gamma_3, Phi_3, Delta_3, Psi_4, h_4, K_4, Gamma_4, Phi_4, Delta_4];

%% initial conditions
Xo=[0.1, 0.06, 0.13, 0.01, 0.05, 0.01, 0.05, 0.01, 0.05, 0.01, 0.05]; 
% [p53]_i, [MDM2 transcript]_i, [Mdm2]_i, 
% [p21 transcript]_i, [p21]_i,
% [PUMA transcript]_i, [PUMA]
% [EGFR transcript]_i, [EGFR]
% [CT transcript]_i, [CT]

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
x_EGFR_m=xint(8,:);
x_EGFR=xint(9,:);
x_CT_m=xint(10,:);
x_CT=xint(11,:);

%% plots
% Fig. 1D; Fig. S1
figure; 
plot(tspan,x_p53,tspan,x_PUMA,tspan,x_p21,'LineWidth',5)
xlabel('Time (hr)'); ylabel('Simulated concentration') 
legend('p53','PUMA','p21')
ylim([0 0.4])

% Fig. S2
% figure; 
% plot(tspan,x_p53,tspan,x_PUMA,tspan,x_p21,tspan,x_EGFR,tspan,x_CT,'LineWidth',5)
% xlabel('Time (hr)'); ylabel('Simulated concentration') 
% legend('p53','PUMA','p21','EGFR','Cryptic')
% ylim([0 0.9])

return

function [dx_dt]=eqn(t,x,p) % Definition of the ODE system
  dx_dt = zeros(11,1);
  dx_dt(1) = p(1) - p(2)*x(3)*(x(1)/(p(3) + x(1))); % p53
  dx_dt(2) = p(4)*(x(1)/(p(5) + x(1))) - p(6)*x(2);
  dx_dt(3) = p(7)*x(2) - p(8)*x(3); % Mdm2
  dx_dt(4) = p(9)*(x(1)^p(10)/(p(11)^p(10) + x(1)^p(10))) - p(12)*x(4);
  dx_dt(5) = p(13)*x(4) - p(14)*x(5); % p21
  dx_dt(6) = p(15)*(x(1)^p(16)/(p(17)^p(16) + x(1)^p(16))) - p(18)*x(6);
  dx_dt(7) = p(19)*x(6) - p(20)*x(7); % PUMA
  dx_dt(8) = p(21)*(x(1)^p(22)/(p(23)^p(22) + x(1)^p(22))) - p(24)*x(8);
  dx_dt(9) = p(25)*x(8) - p(26)*x(9); % EGFR
  dx_dt(10) = p(27)*(x(1)^p(28)/(p(29)^p(28) + x(1)^p(28))) - p(30)*x(10);
  dx_dt(11) = p(31)*x(10) - p(32)*x(11); % CT
return