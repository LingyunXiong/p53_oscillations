%% Description
% This MATLAB program aims to simulate the mathematical model of the
% p53-Mdm2 system proposed by L. Xiong and A. Garfinkel, to demonstrate 
% the robustness of model behavior under different parameter sets 
% specifying Mdm2 dynamics (Fig S6).

function main
%% Model Parameters
alpha = 0.4; 
beta = 4;
gamma = 0.01;
sigma = 0.45;
kappa = 1;
epsilon = 0.7;
phi = 1.6;
delta = 0.75;

%% parameter set 2
% sigma = 0.8;
% epsilon = 0.8;
% phi = 0.8;
% delta = 0.6;

%% parameter set 3
% sigma = 0.6;
% epsilon = 0.7;
% phi = 1.2;
% delta = 0.8;

% set parameter vector
P=[alpha, beta, gamma, sigma, kappa, epsilon, phi, delta]; 

%% Initial Conditions
Xo=[0.1, 0.06, 0.13]; %% [p53]_i, [MDM2 transcript]_i, [Mdm2]_i 

%% ODE calls
tspan=0:.1:25;
sol=ode15s(@(t,x) eqn(t,x,P), tspan, Xo);
xint=deval(sol,tspan);
x_p53=xint(1,:);
x_mdm2=xint(2,:); 
x_Mdm2=xint(3,:); 

%% Visualizations
% (1) Numerical Simulation
figure;
plot(tspan,x_p53,tspan,x_Mdm2,tspan,x_mdm2,'LineWidth',3)
title('Model simulation')
xlabel('Time (hr)'); ylabel('Simulated Concentration') 
legend('p53','Mdm2','MDM2 transcript')
ylim([0.04 0.15])

% (2) Phase Portrait
figure;
plot3(x_p53,x_Mdm2,x_mdm2,'LineWidth',2); hold on;
xlabel('p53'); ylabel('Mdm2'); zlabel('MDM2 transcript');

return

function [dx_dt]=eqn(t,x,p) % Definition of the ODE system
  dx_dt = zeros(3,1);
  dx_dt(1) = p(1) - p(2)*x(3)*(x(1)/(p(3) + x(1)));
  dx_dt(2) = p(4)*(x(1)/(p(5) + x(1))) - p(6)*x(2);
  dx_dt(3) = p(7)*x(2) - p(8)*x(3);
return