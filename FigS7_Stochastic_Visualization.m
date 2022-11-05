%% Description
% This MATLAB program aims to plot results of stochastic simulations of the 
% p53-Mdm2 system proposed by L. Xiong and A. Garfinkel (Fig. S7). 

%% Note: 
% Please refer to the additional files (Stochastic_*.mmd) for 
% how to simulate the ODE system with intrinsic noise in Berkerley Madonna. 

function main
%% Near Hopf boundary (example of noise-induced oscillations)
A_0 = importdata('Data/DataTable_NearHopfBoundary_No_Noise.txt');
mtx_0 = A_0.data; tspan_0 = mtx_0(:,1);
x_p53_0 = mtx_0(:,2); x_Mdm2_0 = mtx_0(:,4);

A = importdata('Data/DataTable_NearHopfBoundary_5percent_Noise.txt');
mtx = A.data; tspan = mtx(:,1);
x_p53 = mtx(:,2); x_mdm2 = mtx(:,3); x_Mdm2 = mtx(:,4);

figure;
plot(tspan,x_p53,tspan,x_Mdm2,tspan,x_mdm2,'LineWidth',4)
title('Near Hopf boundary (with 5% intrinsic noise)')
xlabel('Time (hr)'); ylabel('Simulated concentration') 
legend('p53','Mdm2','MDM2 transcript')
ylim([0 0.3])

figure;
scatter(x_p53((length(tspan)-24000):length(tspan)),x_Mdm2((length(tspan)-24000):length(tspan)),20,'k','filled'); hold on
scatter(x_p53_0((length(tspan_0)-240):length(tspan_0)),x_Mdm2_0((length(tspan_0)-240):length(tspan_0)),20,'r','filled')
xlim([0.12 0.22]); ylim([0.15 0.25])
legend('5% intrinsic noise','No noise')
title('Phase plane portrait (Near Hopf boundary)')
xlabel('p53 concentration'); ylabel('Mdm2 concentration') 

%% Loss of ATM 
% C_0 = importdata('Data/DataTable_LossOfATM_No_Noise.txt');
% mtx_0 = C_0.data; tspan_0 = mtx_0(:,1);
% x_p53_0 = mtx_0(:,2); x_Mdm2_0 = mtx_0(:,4);
% 
% C = importdata('Data/DataTable_LossOfATM_5percent_Noise.txt');
% mtx = C.data; tspan = mtx(:,1);
% x_p53 = mtx(:,2); x_mdm2 = mtx(:,3); x_Mdm2 = mtx(:,4);
% 
% figure;
% plot(tspan,x_p53,tspan,x_Mdm2,tspan,x_mdm2,'LineWidth',4)
% title('Loss of ATM (with 5% intrinsic noise)')
% xlabel('Time (hr)'); ylabel('Simulated concentration') 
% legend('p53','Mdm2','MDM2 transcript')
% ylim([0 0.12])
% 
% figure;
% scatter(x_p53((length(tspan)-24000):length(tspan)),x_Mdm2((length(tspan)-24000):length(tspan)),20,'k','filled'); hold on
% scatter(x_p53_0((length(tspan_0)-240):length(tspan_0)),x_Mdm2_0((length(tspan_0)-240):length(tspan_0)),20,'r','filled')
% xlim([0 0.1]); ylim([0.05 0.15])
% legend('5% intrinsic noise','No noise')
% title('Phase plane portrait (Loss of ATM)')
% xlabel('p53 concentration'); ylabel('Mdm2 concentration') 

%% Hyperactive ATM 
% D_0 = importdata('Data/DataTable_HyperactiveATM_No_Noise.txt');
% mtx_0 = D_0.data; tspan_0 = mtx_0(:,1);
% x_p53_0 = mtx_0(:,2); x_Mdm2_0 = mtx_0(:,4);
% 
% D = importdata('Data/DataTable_HyperactiveATM_5percent_Noise.txt');
% mtx = D.data; tspan = mtx(:,1);
% x_p53 = mtx(:,2); x_mdm2 = mtx(:,3); x_Mdm2 = mtx(:,4);
% 
% figure;
% plot(tspan,x_p53,tspan,x_Mdm2,tspan,x_mdm2,'LineWidth',4)
% title('Hyperactive ATM (with 5% intrinsic noise)')
% xlabel('Time (hr)'); ylabel('Simulated concentration') 
% legend('p53','Mdm2','MDM2 transcript')
% ylim([0 0.3])
% 
% figure;
% scatter(x_p53((length(tspan)-24000):length(tspan)),x_Mdm2((length(tspan)-24000):length(tspan)),20,'k','filled'); hold on
% scatter(x_p53_0((length(tspan_0)-240):length(tspan_0)),x_Mdm2_0((length(tspan_0)-240):length(tspan_0)),20,'r','filled')
% xlim([0.2 0.3]); ylim([0.15 0.25])
% legend('5% intrinsic noise','No noise')
% title('Phase plane portrait (Hyperactive ATM)')
% xlabel('p53 concentration'); ylabel('Mdm2 concentration') 

%% No DSBs
% B_0 = importdata('Data/DataTable_NoDSBs_No_Noise.txt');
% mtx_0 = B_0.data; tspan_0 = mtx_0(:,1);
% x_p53_0 = mtx_0(:,2); x_Mdm2_0 = mtx_0(:,4);
% 
% B = importdata('Data/DataTable_NoDSBs_5percent_Noise.txt');
% mtx = B.data; tspan = mtx(:,1);
% x_p53 = mtx(:,2); x_mdm2 = mtx(:,3); x_Mdm2 = mtx(:,4);
% 
% figure;
% plot(tspan,x_p53,tspan,x_Mdm2,tspan,x_mdm2,'LineWidth',4)
% title('No DSBs (with 5% intrinsic noise)')
% xlabel('Time (hr)'); ylabel('Simulated concentration') 
% legend('p53','Mdm2','MDM2 transcript')
% ylim([0.0 0.12])
% 
% figure;
% scatter(x_p53((length(tspan)-24000):length(tspan)),x_Mdm2((length(tspan)-24000):length(tspan)),20,'k','filled'); hold on
% scatter(x_p53_0((length(tspan_0)-240):length(tspan_0)),x_Mdm2_0((length(tspan_0)-240):length(tspan_0)),20,'r','filled')
% xlim([0 0.1]); ylim([0.05 0.15])
% legend('5% intrinsic noise','No noise')
% title('Phase plane portrait (No DSBs)')
% xlabel('p53 concentration'); ylabel('Mdm2 concentration') 

return
