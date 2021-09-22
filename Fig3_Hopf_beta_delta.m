%% Description
% This MATLAB program aims to visualize Hopf bifurcation region in
% beta-delta parameter space where p53 oscillations can be self-sustained
% (Fig. 3).

function main
%% Load Data
load("Data/EP_Jacobian_beta_delta_rawData.mat")

param_beta_fc=param_beta./4;
param_delta_fc=param_delta./0.75;

%% Visualizations
% (1) X_EP as a function of model parameters (Fig 3B)
% figure;
% s1=surf(param_beta_fc,param_delta_fc,mtx_X0);
% set(s1,'linestyle','none')
% xlabel('Value of \beta (Fold)'); ylabel('Value of \delta (Fold)'); 
% zlabel('Equilibrium p53 Concentration');
% colorbar;

% (2) p as a function of model parameters (Fig 3C)
figure;
h2=heatmap(param_beta_fc,param_delta_fc,mtx_p,'GridVisible','off');
caxis([-1 1]); cmap = [pink(1); white(1)];
colormap(cmap);
title('');
xlabel('Value of \beta (Fold)'); ylabel('Value of \delta (Fold)');
XLabels=1:length(param_beta);
CustomXLabels = string(param_beta_fc);
CustomXLabels(mod(XLabels,20) ~= 1) = " ";
h2.XDisplayLabels = CustomXLabels;
YLabels=1:length(param_delta);
CustomYLabels = string(param_delta_fc);
CustomYLabels(mod(YLabels,15) ~= 1) = " ";
h2.YDisplayLabels = CustomYLabels;
h2.YDisplayData = flipud(h2.YDisplayData); 

return