%% Description
% This MATLAB program aims to simulate the mathematical model of the
% p53-Mdm2 system proposed by L. Xiong and A. Garfinkel, to evaluate the 
% impact of diverse oncogenic alterations in the p53 pathway on the
% oscillatory competence of p53 in response to genotoxic stress. 

%% Note: 
% Please refer to an additional file (Linear_Stability_Analysis.m) for 
% calculating equilibrium concentrations. 

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

%% Single Parameter Bifurcation Analysis
param=0.1:0.005:0.7; % parameter range for alpha
% param=1:0.05:8; % parameter range for beta
% param=0.1:0.005:0.7; % parameter range for sigma
% param=0.4:0.005:1.2; % parameter range for delta

tspan=0:.1:120;
mtx_p53 = zeros(length(param),length(tspan));
for i = 1:length(param)
    alpha=param(i);
    P=[alpha, beta, gamma, sigma, kappa, epsilon, phi, delta];
    sol=ode15s(@(t,x) eqn(t,x,P), tspan, Xo);
    xint=deval(sol,tspan);
    mtx_p53(i,:)=xint(1,:);
end

% record terminal system behavior 
mtx_p53_ss = mtx_p53(:,((length(tspan)-1)*0.25):length(tspan));
[min_val,loc] = min(mtx_p53_ss,[],2);
vec_min = min_val;
[max_val,loc] = max(mtx_p53_ss,[],2);
vec_max = max_val;

%% Visualizations
figure;
plot(param,vec_min,'color','#0072BD','LineWidth',2); hold on;
plot(param,vec_max,'color','#0072BD','LineWidth',2);
xlabel('Parameter Value'); ylabel('p53 concentration'); 

return

function [dx_dt]=eqn(t,x,p) % Definition of the ODE system
  dx_dt = zeros(3,1);
  dx_dt(1) = p(1) - p(2)*x(3)*(x(1)/(p(3) + x(1)));
  dx_dt(2) = p(4)*(x(1)/(p(5) + x(1))) - p(6)*x(2);
  dx_dt(3) = p(7)*x(2) - p(8)*x(3);
return