%% Description
% This MATLAB program aims to visualize Hopf bifurcation region in
% beta-delta parameter space where p53 oscillations can be self-sustained
% (Fig S3).

function main
%% Load Data for Fig. S3A-B
load("Data/EP_Jacobian_beta_delta_rawData.mat")

param_beta_fc=param_beta./4;
param_delta_fc=param_delta./0.75;

%% Visualizations
(1) p^2-4q as a function of model parameters (Fig. S3A)
figure;
s1=surf(param_beta_fc,param_delta_fc,mtx_res);
set(s1,'linestyle','none')
xlabel('Value of \beta (Fold)'); ylabel('Value of \delta (Fold)'); zlabel('p^2-4q');
colorbar;

(2) lambda_real as a function of model parameters (Fig. S3B)
figure;
s2=surf(param_beta_fc,param_delta_fc,mtx_lambda_real);
set(s2,'linestyle','none')
xlabel('Value of \beta (Fold)'); ylabel('Value of \delta (Fold)'); zlabel('\lambda_{real}');
colorbar;

%% Load Data for Fig. S3C-D
% load("Data/EP_Jacobian_A_B_rawData.mat")
% 
% param_A_fc=param_A./0.4;
% param_B_fc=param_B./(4*0.45);

%% Visualizations
% (3) p^2-4q as a function of model parameters (Fig. S3C)
% figure;
% s3=surf(param_B_fc,param_A_fc,mtx_res);
% set(s3,'linestyle','none')
% xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)'); zlabel('p^2-4q');
% colorbar;

% (4) lambda_real as a function of model parameters (Fig. S3D)
% figure;
% s4=surf(param_B_fc,param_A_fc,mtx_lambda_real);
% set(s4,'linestyle','none')
% xlabel('Value of \beta\sigma (Fold)'); ylabel('Value of \alpha (Fold)'); zlabel('\lambda_{real}');
% colorbar;

return