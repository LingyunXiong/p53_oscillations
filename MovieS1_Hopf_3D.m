%% Description
% This MATLAB program aims to visualize Hopf bifurcation subspace in
% alpha-beta*sigma-delta parameter space where p53 oscillations can be
% self-sustained (MovieS1.mp4).

function main
%% Load Data
load("Data/EP_Jacobian_3D_dense_rawData.mat")

param_A_fc=param_A./0.4;
param_B_fc=param_B./1.8; 
param_delta_fc=param_delta./0.75; 

%% Animation
t = linspace(0,5.8*pi,200);
h = figure; 
axis tight manual 

p = patch(isosurface(param_B_fc(1:27),param_delta_fc(1:28),param_A_fc(1:20),mtx_p(1:28,1:27,1:20),0)); hold on 
xlabel('Value of \beta\sigma (Fold)'); 
ylabel('Value of \delta (Fold)'); 
zlabel('Value of \alpha (Fold)');
zticks(0:0.5:2.5);
p.FaceColor = '#E1F1FF';
p.EdgeColor = 'none';
daspect([1 1 1])
view(3); 
axis tight
camlight 
lighting gouraud
grid on

% add auxilliary items
plot3(1,1,1,'ro','MarkerSize',7,'MarkerFaceColor','#FF0000');
txt = 'Hopf'; text(1.4,1.2,2.4,txt,'FontSize',20);
txt = 'No Hopf'; text(1.6,0.5,0.2,txt,'FontSize',20);
txt = ['p53' newline 'missense' newline 'mutations']; text(0.3,1.8,0.8,txt,'FontSize',12);
txt = 'Loss of p53'; text(0.8,1.2,0.4,txt,'FontSize',12);
txt = ['Overexpression of' newline 'Mdm2 or Mdm4']; text(2,1,1.2,txt,'FontSize',12);
txt = 'Loss of ATM'; text(1.2,0.3,0.9,txt,'FontSize',12);
x=[1,1]; y=[1,1]; z=[0,0.01];plot3(x,y,z,'.w','LineWidth',0.01);
X=ones(1,4); Y=ones(1,4); Z=ones(1,4); U=[-0.75,0,1,0.5]; V=[0,0,0,-0.5]; W=[0,-0.4,0,0];
quiver3(X,Y,Z,U,V,W,0,'-k','LineWidth',2.3,'MaxHeadSize',0.4);


% Create frames by rotating the 3D object
for i=1:length(t)
    view([-52+20*t(i) 5]);
    mVector(i) = getframe(h);
end

%% Write the frames out as a MPEG-4 file
myWriter = VideoWriter('p53_Hopf_3D','MPEG-4');
myWriter.FrameRate=10;

open(myWriter);
writeVideo(myWriter, mVector);
close(myWriter);

return