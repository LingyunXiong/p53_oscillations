%% Description
% This MATLAB program aims to perform analytic calculation to derive
% parametric conditions for Hopf bifurcation symbolically. 

%% Model Parameters
syms x
alpha = 0.4; 
beta = 4;
gamma = 0.01;
sigma = 0.45;
kappa = 1;
epsilon = 0.7;
phi = 1.6;
delta = 0.75;


%% Step 1: Find equilibrium points
eqn1 = x^2 - alpha*epsilon*delta*(kappa+x)*(gamma+x)/(beta*sigma*phi) == 0;
S = solve(eqn1, x);
X0 = S(2); % solving X_EP (double check it is positive)

%% Step 2: Study the stability of equilibria
T2 = alpha*gamma/(X0*(gamma+X0)) + epsilon + delta;
T3 = alpha*gamma*(epsilon+delta)/(X0*(gamma+X0)) + epsilon*delta;
T4 = alpha*epsilon*delta*(gamma/(X0*(gamma+X0)) + kappa/(X0*(kappa+X0)));
eqn2 = x^3 + T2*x^2 + T3*x + T4 == 0;
E = solve(eqn2, x,'MaxDegree',3); % solving eigenvalues of the Jacobian matrix

%% Step 3: Derive the parametric conditions for Hopf bifurcation
% Please double check the identity of lambda_real, might need to change order
p = T2 + E(1); % p < 0
q = -T4/E(1);
res = p^2 - 4*q; % p^2 -4q < 0



