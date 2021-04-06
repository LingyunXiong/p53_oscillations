%% Description
% This MATLAB program aims to plot single-parameter bifurcation diagrams 
% for the ODE model of the p53-Mdm2 system proposed by L. Xiong and A.
% Garfinkel (Fig. 2D). 

%% Note: 
% Please refer to an additional file (Hopf_Bifurcation_Analysis.m) for 
% details of calculating equilibrium p53 concentrations. 

function main
%% alpha
load("Data/Single_Parameter_bifurcation_rawData_alpha.mat")
alpha_param_fc = alpha_param./0.4;

figure;
plot(alpha_param_fc(1:53),alpha_vec_x2(1:53),'color','k','LineWidth',4); hold on
plot(alpha_param_fc(53:length(alpha_param)),alpha_vec_x2(53:length(alpha_param)),'color','k','LineStyle',':','LineWidth',4)
plot(alpha_param_fc(53:length(alpha_param)),alpha_vec_min(53:length(alpha_param)),'color','#0072BD','LineWidth',4)
plot(alpha_param_fc(53:length(alpha_param)),alpha_vec_max(53:length(alpha_param)),'color','#0072BD','LineWidth',4)
title('\alpha'); xlabel('Parameter Value (Fold)'); ylabel('Simulated p53 concentration') 
ylim([0 0.5])

%% delta
load("Single_Parameter_bifurcation_rawData_delta.mat")
delta_param_fc = delta_param./0.75;

figure;
plot(delta_param_fc(1:71),delta_vec_x2(1:71),'color','k','LineWidth',4); hold on
plot(delta_param_fc(148:length(delta_param)),delta_vec_x2(148:length(delta_param)),'color','k','LineWidth',4)
plot(delta_param_fc(71:148),delta_vec_x2(71:148),'color','k','LineStyle',':','LineWidth',4)
plot(delta_param_fc(71:148),delta_vec_min(71:148),'color','#0072BD','LineWidth',4)
plot(delta_param_fc(71:148),delta_vec_max(71:148),'color','#0072BD','LineWidth',4)
title('\delta'); xlabel('Parameter Value (Fold)'); ylabel('Simulated p53 concentration') 
ylim([0 0.5])

%% beta
load("Single_Parameter_bifurcation_rawData_beta.mat")
beta_param_fc = beta_param./4;

figure;
plot(beta_param_fc(1:24),beta_vec_x2(1:24),'color','k','LineWidth',4); hold on
plot(beta_param_fc(73:length(beta_param)),beta_vec_x2(73:length(beta_param)),'color','k','LineWidth',4)
plot(beta_param_fc(24:73),beta_vec_x2(24:73),'color','k','LineStyle',':','LineWidth',4)
plot(beta_param_fc(24:73),beta_vec_min(24:73),'color','#0072BD','LineWidth',4)
plot(beta_param_fc(24:73),beta_vec_max(24:73),'color','#0072BD','LineWidth',4)
title('\beta'); xlabel('Parameter Value (Fold)'); ylabel('Simulated p53 concentration') 
ylim([0 0.5])

%% sigma
load("Single_Parameter_bifurcation_rawData_sigma.mat")
sigma_param_fc = sigma_param./0.45;

figure;
plot(sigma_param_fc(1:32),sigma_vec_x2(1:32),'color','k','LineWidth',4); hold on
plot(sigma_param_fc(86:length(sigma_param)),sigma_vec_x2(86:length(sigma_param)),'color','k','LineWidth',4)
plot(sigma_param_fc(32:86),sigma_vec_x2(32:86),'color','k','LineStyle',':','LineWidth',4)
plot(sigma_param_fc(32:86),sigma_vec_min(32:86),'color','#0072BD','LineWidth',4)
plot(sigma_param_fc(32:86),sigma_vec_max(32:86),'color','#0072BD','LineWidth',4)
title('\sigma'); xlabel('Parameter Value (Fold)'); ylabel('Simulated p53 concentration') 
ylim([0 0.5])

return
