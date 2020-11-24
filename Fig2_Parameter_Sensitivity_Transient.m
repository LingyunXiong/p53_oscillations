%% Description
% This MATLAB program aims to simulate the mathematical model of the
% p53-Mdm2 system proposed by L. Xiong and A. Garfinkel, to evaluate the 
% impact of diverse oncogenic alterations in the p53 pathway on the
% oscillatory competence of p53 in response to genotoxic stress. 

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
% Xo=[0.1, 0.06, 0.16]; %% alternative set


%% Parameter Sensitivity Test
param=flip(0.1:0.005:0.45); % parameter range for alpha
% param=flip(1:0.05:8); % parameter range for beta
% param=flip(0.1:0.005:0.9); % parameter range for sigma
% param=flip(0.2:0.005:0.9); % parameter range for delta
% param=flip(0.3:0.01:1.4); % parameter range for epsilon
% param=flip(1:0.025:3); % parameter range for phi
% param=flip(0.005:0.0005:0.03); % parameter range for gamma
% param=flip(0.05:0.025:2); % parameter range for kappa


tspan=0:.1:48;
mtx_p53 = zeros(length(param),length(tspan));
for i = 1:length(param)
    alpha=param(i);
    P=[alpha, beta, gamma, sigma, kappa, epsilon, phi, delta];
    sol=ode15s(@(t,x) eqn(t,x,P), tspan, Xo);
    xint=deval(sol,tspan);
    mtx_p53(i,:)=xint(1,:);
end

%% Visualizations
figure;
h=heatmap(tspan,param,mtx_p53,'GridVisible','off');
h.Colormap=jet;
title('\alpha');
xlabel('Time (hrs)'); ylabel('Parameter Value ');
XLabels=1:length(tspan);
CustomXLabels = string(tspan);
CustomXLabels(mod(XLabels,50) ~= 1) = " ";
h.XDisplayLabels = CustomXLabels;
YLabels=1:length(param);
CustomYLabels = string(param);
CustomYLabels(mod(YLabels,10) ~= 1) = " ";
h.YDisplayLabels = CustomYLabels;
caxis(h,[0.01 0.16]);

return

function [dx_dt]=eqn(t,x,p) % Definition of the ODE system
  dx_dt = zeros(3,1);
  dx_dt(1) = p(1) - p(2)*x(3)*(x(1)/(p(3) + x(1)));
  dx_dt(2) = p(4)*(x(1)/(p(5) + x(1))) - p(6)*x(2);
  dx_dt(3) = p(7)*x(2) - p(8)*x(3);
return