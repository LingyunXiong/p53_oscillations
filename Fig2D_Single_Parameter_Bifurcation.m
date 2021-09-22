%% Description
% This MATLAB program aims to plot single-parameter bifurcation diagrams 
% for the ODE model of the p53-Mdm2 system proposed by L. Xiong and A.
% Garfinkel (Fig. 2D). 

%% Note: 
% Please refer to the additional file (Codim1_Bifurcation_Simulation.m) for 
% how to simulate bifurcation numerically. 

function main
%% alpha
% load("Data/Codim1_alpha_IC_sim.mat")
% param_fc = param./0.4;
% 
% figure;
% scatter(param_fc(27:length(param)),vec_min(27:length(param)),20,[0 0.4470 0.7410],'filled'); hold on
% scatter(param_fc(27:length(param)),vec_max(27:length(param)),20,[0 0.4470 0.7410],'filled')
% plot(param_fc(1:27),vec_x2(1:27),'color','k','LineWidth',2)
% plot(param_fc(26:length(param)),vec_x2(26:length(param)),'color','k','LineStyle',':','LineWidth',2)
% title('\alpha'); xlabel('Parameter Value (Fold)'); ylabel('Simulated p53 concentration') 
% ylim([0 0.5])

% alpha inlet
% load("Data/Codim1_alpha_refine_IC_sim.mat")
% param_fc = param./0.4;
% 
% scatter(param_fc(52:58),vec_min(52:58),40,[0 0.4470 0.7410],'filled'); hold on
% scatter(param_fc(52:58),vec_max(52:58),40,[0 0.4470 0.7410],'filled')
% scatter([0.3567, 0.3567, 0.3587, 0.3587]/0.4,[0.0762, 0.0818, 0.0779, 0.0810],40,[0 0.4470 0.7410])
% plot(param_fc(48:53),vec_x2(48:53),'color','k','LineWidth',3)
% plot(param_fc(52:58),vec_x2(52:58),'color','k','LineStyle',':','LineWidth',3)

%% delta
% load("Data/Codim1_delta_IC_sim.mat")
% param_fc = param./0.75;
% 
% figure
% scatter(param_fc(72:148),vec_min(72:148),20,[0 0.4470 0.7410],'filled'); hold on
% scatter(param_fc(72:148),vec_max(72:148),20,[0 0.4470 0.7410],'filled')
% scatter([1.032, 1.032, 1.035, 1.035]/0.75,[0.1164, 0.1265, 0.1125, 0.13],20,[0 0.4470 0.7410])
% plot(param_fc(1:72),vec_x2(1:72),'color','k','LineWidth',2)
% plot(param_fc(71:148),vec_x2(71:148),'color','k','LineStyle',':','LineWidth',2)
% plot(param_fc(147:length(param)),vec_x2(147:length(param)),'color','k','LineWidth',2)
% title('\delta'); xlabel('Parameter Value (Fold)'); ylabel('Simulated p53 concentration') 
% ylim([0 0.5])

%% beta
load("Data/Codim1_beta_IC_sim.mat")
param_fc = param./4;

figure
scatter(param_fc(24:73),vec_min(24:73),20,[0 0.4470 0.7410],'filled'); hold on
scatter(param_fc(24:73),vec_max(24:73),20,[0 0.4470 0.7410],'filled')
scatter([2.1800, 2.1800, 2.2500, 2.2500]/4,[0.152, 0.182, 0.155, 0.1665],20,[0 0.4470 0.7410])
plot(param_fc(1:27),vec_x2(1:27),'color','k','LineWidth',2)
plot(param_fc(24:74),vec_x2(24:74),'color','k','LineStyle',':','LineWidth',2)
plot(param_fc(73:length(param)),vec_x2(73:length(param)),'color','k','LineWidth',2)
title('\beta'); xlabel('Parameter Value (Fold)'); ylabel('Simulated p53 concentration') 
ylim([0 0.5])

%% sigma
% load("Data/Codim1_sigma_IC_sim.mat")
% param_fc = param./0.45;
% 
% figure;
% scatter(param_fc(32:86),vec_min(32:86),20,[0 0.4470 0.7410],'filled'); hold on
% scatter(param_fc(32:86),vec_max(32:86),20,[0 0.4470 0.7410],'filled')
% scatter([0.2475, 0.2473, 0.254, 0.252]/0.45,[0.1456, 0.1867, 0.1540, 0.172],20,[0 0.4470 0.7410])
% plot(param_fc(1:34),vec_x2(1:34),'color','k','LineWidth',2)
% plot(param_fc(32:86),vec_x2(32:86),'color','k','LineStyle',':','LineWidth',2)
% plot(param_fc(86:length(param)),vec_x2(86:length(param)),'color','k','LineWidth',2)
% title('\sigma'); xlabel('Parameter Value (Fold)'); ylabel('Simulated p53 concentration') 
% ylim([0 0.5])

return
