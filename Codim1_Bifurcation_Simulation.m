%% Description
% This MATLAB program aims to perform single-parameter bifuurcation 
% analysis via numerical simulation of the ODE model proposed by L. Xiong 
% and A. Garfinkel. 

%% Baseline Parameters
alpha = 0.4; 
beta = 4;
gamma = 0.01;
sigma = 0.45;
kappa = 1;
epsilon = 0.7;
phi = 1.6;
delta = 0.75;


%% Codimension 1 bifurcation analysis
param=0.1:0.01:0.7; % parameter range for alpha
% param=0.1:0.0025:0.7; % parameter range for alpha (refined)
% param=1:0.05:8; % parameter range for beta
% param=0.09:0.005:0.72; % parameter range for sigma
% param=0.3:0.005:1.2; % parameter range for delta

tspan=0:.01:800;
Xo=[0.1, 0.06, 0.13];
mtx_p53 = zeros(length(param),length(tspan));
vec_x2=zeros(length(param),1);
mtx_eig2=zeros(length(param),3);

for i = 1:length(param)
    alpha=param(i);
%     beta=param(i);
%     sigma=param(i);
%     delta=param(i);
    [x0, r0, y0, lambda_2] = evaluate_ep(alpha);
    Xo(1) = x0; Xo(2) = r0; Xo(3) = y0; % use EP as the initial condition
    % comment out the line above if not use EP as the initial condition
    vec_x2(i) = x0;
    mtx_eig2(i,:) = lambda_2;
    
    P=[alpha, beta, gamma, sigma, kappa, epsilon, phi, delta];
    sol=ode45(@(t,x) eqn(t,x,P), tspan, Xo);
    xint=deval(sol,tspan);
    mtx_p53(i,:)=xint(1,:);
end

mtx_p53_ss = mtx_p53(:,(length(tspan)-24/0.01):length(tspan));
[min_val,loc] = min(mtx_p53_ss,[],2); vec_min = min_val';
[max_val,loc] = max(mtx_p53_ss,[],2); vec_max = max_val';

save('Codim1_alpha_EP_sim.mat','param','vec_max','vec_min','vec_x2','mtx_eig2')
% save('Codim1_alpha_IC_sim.mat','param','vec_max','vec_min','vec_x2','mtx_eig2')

%% Function Definitions
function [x2, r2, y2, lambda2]=evaluate_ep(alpha) 
  syms X 
%   alpha = 0.4; 
  beta = 4;
  gamma = 0.01;
  sigma = 0.45;
  kappa = 1;
  epsilon = 0.7;
  phi = 1.6;
  delta = 0.75;
  eqn = (alpha*epsilon*delta - beta*sigma*phi)*X^2 + alpha*epsilon*delta*(kappa+gamma)*X + alpha*epsilon*delta*kappa*gamma == 0;
  S = solve(eqn, X);
  
  x2 = vpa(S(2), 6);
  r2 = vpa(((sigma/epsilon) * x2/(kappa+x2)), 6);
  y2 = vpa(((sigma*phi/(epsilon*delta)) * x2/(kappa+x2)), 6);
  
  f1 = [-alpha*gamma/(x2*(gamma+x2)) 0 -beta*x2/(gamma+x2)];
  f2 = [sigma*kappa/(kappa+x2)^2 -epsilon 0];
  f3 = [0 phi -delta];
  B = sym([f1; f2; f3]);
  lambda2 = vpa(eig(B),2);
end

function [dx_dt]=eqn(t,x,p) % ODE system
  dx_dt = zeros(3,1);
  dx_dt(1) = p(1) - p(2)*x(3)*(x(1)/(p(3) + x(1)));
  dx_dt(2) = p(4)*(x(1)/(p(5) + x(1))) - p(6)*x(2);
  dx_dt(3) = p(7)*x(2) - p(8)*x(3);
end

