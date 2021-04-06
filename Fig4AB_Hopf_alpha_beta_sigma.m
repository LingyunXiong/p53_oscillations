%% Description
% This MATLAB program aims to visualize Hopf bifurcation region in
% alpha-beta*sigma parameter space where p53 oscillations can be
% self-sustained (Fig. 4A-B; Fig. S3C-D; Fig. S4).

function main
%% Load Data
load("Data/EP_Jacobian_A_B_rawData.mat")

param_A_fc=param_A./0.4;
param_B_fc=param_B./1.8;

%% Visualizations
% (1) X_EP as a function of model parameters
% figure;
% s1=surf(param_B_fc,param_A_fc,mtx_X0);
% set(s1,'linestyle','none')
% xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)'); 
% zlabel('Equilibrium p53 Concentration');
% colorbar;

% (2) p as a function of model parameters
figure;
h2=heatmap(param_B_fc,param_A_fc,mtx_p,'GridVisible','off');
caxis([-1 2]); cmap = [pink(1); white(2)];
colormap(cmap);
title('');
xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)');
XLabels=1:length(param_B);
CustomXLabels = string(param_B_fc);
CustomXLabels(mod(XLabels,36) ~= 19) = " ";
h2.XDisplayLabels = CustomXLabels;
YLabels=1:length(param_A);
CustomYLabels = string(param_A_fc);
CustomYLabels(mod(YLabels,20) ~= 0) = " ";
h2.YDisplayLabels = CustomYLabels;
h2.YDisplayData = flipud(h2.YDisplayData); 

% (3) lambda_real as a function of model parameters
% figure;
% s3=surf(param_B_fc,param_A_fc,mtx_lambda_real);
% set(s3,'linestyle','none')
% xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)'); zlabel('\lambda_{real}');
% colorbar;

% (4) p^2-4q as a function of model parameters
% figure;
% s4=surf(param_B_fc,param_A_fc,mtx_res);
% set(s4,'linestyle','none')
% xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)'); zlabel('p^2-4q');
% colorbar;

return