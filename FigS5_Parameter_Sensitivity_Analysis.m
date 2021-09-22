%% Description
% This MATLAB program aims to simulate the mathematical model of the
% p53-Mdm2 system proposed by L. Xiong and A. Garfinkel, to evaluate the
% sensitivity of the oscillatory behavior of the p53 to values of single 
% parameter (Fig. S5). 

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

%% Initial Conditions
Xo=[0.1, 0.06, 0.13]; %% [p53]_i, [MDM2 transcript]_i, [Mdm2]_i 

%% Parameter Sensitivity Test
% param=flip(0.005:0.0001:0.02); % parameter range for gamma
% param=flip(0.5:0.01:2); % parameter range for kappa
param=flip(0.4:0.025:3.2); % parameter range for phi
% param=flip(0.3:0.01:1.4); % parameter range for epsilon

%% ODE Calls
tspan=0:.1:48;
mtx_p53 = zeros(length(param),length(tspan));
for i = 1:length(param)
%     gamma=param(i);
%     kappa=param(i);
    phi=param(i);
%     epsilon=param(i);
    P=[alpha, beta, gamma, sigma, kappa, epsilon, phi, delta];
    sol=ode15s(@(t,x) eqn(t,x,P), tspan, Xo);
    xint=deval(sol,tspan);
    mtx_p53(i,:)=xint(1,:);
end

%% Visualizations
% param_fc = param./0.01; % for gamma
% param_fc = param./1; % for kappa
param_fc = param./1.6; % for phi
% param_fc = param./0.7; % for epsilon

figure;
h=heatmap(tspan,param_fc,mtx_p53,'GridVisible','off');
h.Colormap=jet;
title('\phi');
xlabel('Time (hr)'); ylabel('Parameter Value (Fold)');
XLabels=1:length(tspan);
CustomXLabels = string(tspan);
CustomXLabels(mod(XLabels,50) ~= 1) = " ";
h.XDisplayLabels = CustomXLabels;
YLabels=1:length(param_fc);
CustomYLabels = string(param_fc);
CustomYLabels(mod(YLabels,32) ~= 1) = " ";
h.YDisplayLabels = CustomYLabels;
caxis(h,[0.01 0.16]);

return

function [dx_dt]=eqn(t,x,p) % Definition of the ODE system
  dx_dt = zeros(3,1);
  dx_dt(1) = p(1) - p(2)*x(3)*(x(1)/(p(3) + x(1)));
  dx_dt(2) = p(4)*(x(1)/(p(5) + x(1))) - p(6)*x(2);
  dx_dt(3) = p(7)*x(2) - p(8)*x(3);
return