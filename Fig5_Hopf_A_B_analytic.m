%% Description
% This MATLAB program aims to perform analytic calculation to derive
% parametric conditions for Hopf bifurcation symbolically, to be followed 
% by numerical calculation to visualize regions in the parameter space
% where p53 oscillations can be self-sustained. 

%% Model Parameters
syms x A B
gamma = 0.01;
kappa = 1;
epsilon = 0.7;
phi = 1.6;
delta = 0.75;

%% Step 1: Find equilibrium points
eqn1 = x^2 - A*epsilon*delta*(kappa+x)*(gamma+x)/(B*phi) == 0;
S = solve(eqn1, x);
X0 = S(2); % solving X_EP (double check it is positive)

%% Step 2: Study the stability of equilibria
T2 = A*gamma/(X0*(gamma+X0)) + epsilon + delta;
T3 = A*gamma*(epsilon+delta)/(X0*(gamma+X0)) + epsilon*delta;
T4 = A*epsilon*delta*(gamma/(X0*(gamma+X0)) + kappa/(X0*(kappa+X0)));
eqn2 = x^3 + T2*x^2 + T3*x + T4 == 0;
E = solve(eqn2, x,'MaxDegree',3); % solving eigenvalues of the Jacobian matrix

%% Step 3: Derive the parametric conditions for Hopf bifurcation
p = T2 + E(3);
% q = -T4/E(3);
