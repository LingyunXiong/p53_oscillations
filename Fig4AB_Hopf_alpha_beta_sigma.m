%% Description
% This MATLAB program aims to visualize Hopf bifurcation region in
% alpha-beta*sigma parameter space where p53 oscillations can be
% self-sustained (Fig. 4A-B).

function main
%% Fig. 4A
% load("Data/EP_Jacobian_A_B_rawData.mat")
% 
% param_A_fc=param_A./0.4;
% param_B_fc=param_B./1.8;

% figure;
% s1=surf(param_B_fc,param_A_fc,mtx_X0);
% set(s1,'linestyle','none')
% xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)'); 
% zlabel('Equilibrium p53 Concentration');
% colorbar;

%% Fig. 4B
load("Data/EP_Jacobian_small_A_B_rawData.mat")

param_A_fc=param_A./0.4;
param_B_fc=param_B./1.8;

figure;
h4=heatmap(param_B_fc,param_A_fc,mtx_X0,'GridVisible','off');
caxis([-24 18]); cmap = [white(24); pink(18)];
colormap(cmap);
xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)');
XLabels=1:length(param_B);
CustomXLabels = string(param_B_fc);
CustomXLabels(mod(XLabels,9) ~= 0) = " ";
h4.XDisplayLabels = CustomXLabels;
YLabels=1:length(param_A);
CustomYLabels = string(param_A_fc);
CustomYLabels(mod(YLabels,10) ~= 0) = " ";
h4.YDisplayLabels = CustomYLabels;
h4.YDisplayData = flipud(h4.YDisplayData); 

return