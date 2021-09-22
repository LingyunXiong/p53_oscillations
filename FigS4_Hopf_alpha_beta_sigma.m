%% Description
% This MATLAB program aims to visualize Hopf bifurcation region in
% alpha-beta*sigma parameter space where p53 oscillations can be
% self-sustained (Fig. S4).

function main
%% Load Data
load("Data/EP_Jacobian_A_B_rawData.mat")

param_A_fc=param_A./0.4;
param_B_fc=param_B./1.8;

%% Visualizations
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

return