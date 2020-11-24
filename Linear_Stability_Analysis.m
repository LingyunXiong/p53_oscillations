%% Description
% This MATLAB program aims to perform basic linear stability analysis of 
% the ODE model proposed by L. Xiong and A. Garfinkel. 

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

%% Step 1: Find Equilibrium Points
eqn = x^2 - alpha*epsilon*delta*(kappa+x)*(gamma+x)/(beta*sigma*phi) == 0;
S = solve(eqn, x);
x0 = simplify(S(2)); % solving X_EP (double check it is positive)

%% Step 2: Study the Stability of Equilibria
f1 = [-alpha*gamma/(x0*(gamma+x0)) 0 -beta*x0/(gamma+x0)];
f2 = [sigma*kappa/((kappa+x0)^2) -epsilon 0];
f3 = [0 phi -delta];
J = sym([f1; f2; f3]); % Jacobian matrix
lambda = eig(J); % solving eigenvalues of the Jacobian matrix

