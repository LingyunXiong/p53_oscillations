%% Description
% This MATLAB program aims to visualize Hopf bifurcation region in
% alpha-beta*sigma parameter space where p53 oscillations can be
% self-sustained (Fig. 4).

function main
%% Load Data
load("Data/EP_Jacobian_A_B_rawData.mat")

param_A_fc=param_A./0.4;
param_B_fc=param_B./1.8;

%% Visualizations
% figure;
% s1=surf(param_B_fc,param_A_fc,mtx_X0);
% set(s1,'linestyle','none')
% xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)'); 
% zlabel('Equilibrium p53 Concentration');
% colorbar;

return