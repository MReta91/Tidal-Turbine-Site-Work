%Number of samples, double check when running
figure
ylabel('II_b_{ij}','Fontsize',14);
xlabel('III_b_{ij}','Fontsize',14);
title('Anisotropy Invariant Map','Fontsize',14);
xlim([-.1 .3])
ylim([0 .7])
x=-(1/36):.00001:2/9;
y=(2/9)+2*x;
w=x;
v=(3/2)*((4/3)*abs(w)).^(2/3);
hold on 
plot(x,y,'k','LineWidth',2)
plot(w,v,'k','LineWidth',2)
text(.025,0.05,'Isotropic Turbulence','HorizontalAlignment','left','Color','black','FontSize',14);
text(0.05,0.2,'Axisymetric','HorizontalAlignment','left','Color','black','FontSize',14);
text(-.05,0.6,'Two-Component','HorizontalAlignment','left','Color','black','FontSize',14);
text(.1,0.65,'One Component','HorizontalAlignment','left','Color','black','FontSize',14);
text(-.075,0.3,'Isotropic Two Component','HorizontalAlignment','left','Color','black','FontSize',14);

%------------------------------------------------


for k=9,5,1,6;
L=LinesRD(k).Dimensions.Z;
i=size(L,1);
RS=zeros(3,3,i);
uupM=mean(LinesRD(k).ReynoldStresses.uu,1);
uvpM=mean(LinesRD(k).ReynoldStresses.uv,1);
uwpM=mean(LinesRD(k).ReynoldStresses.uw,1);
vvpM=mean(LinesRD(k).ReynoldStresses.vv,1);
vwpM=mean(LinesRD(k).ReynoldStresses.vw,1);
wwpM=mean(LinesRD(k).ReynoldStresses.ww,1);
Q2=LinesRD(k).TurbulenceValues.KineticEnergies.Q2d;
for i=1:size(LinesRD(k).Dimensions.Z,1)
RS(:,:,i)=[uupM(1,i) uvpM(1,i) uwpM(1,i);
           uvpM(1,i) vvpM(1,i) vwpM(1,i); 
           uwpM(1,i) vwpM(1,i) wwpM(1,i)];
k(:,i)=RS(1,1,i)+RS(2,2,i)+RS(3,3,i);
end

%-----------------------------------------
kd3=[1/3 0 0; 0 1/3 0; 0 0 1/3];
for i=1:size(L,1);
Bij(:,:,i)=RS(:,:,i)./k(:,i)-kd3;
end

test=Q2.^3;
II=squeeze(Bij(1,3,:).*Bij(3,1,:))./2;
III=squeeze(Bij(1,2,:).*Bij(2,3,:).*Bij(3,1,:))./3;
%------------------------------------------------
scatter(III',II,[],L,'filled')
clearvars Bij Q2 II III L RS uupM uvpM uwpM vvpM vwpM wwpM k
end
ylabel('II_b_{ij}','Fontsize',14);
xlabel('III_b_{ij}','Fontsize',14);
title('Anisotropy Invariant Map','Fontsize',14);
xlim([-.1 .3])
ylim([0 .7])
x=-(1/36):.00001:2/9;
y=(2/9)+2*x;
w=x;
v=(3/2)*((4/3)*abs(w)).^(2/3);
hold on 
plot(x,y,'k','LineWidth',2)
plot(w,v,'k','LineWidth',2)
text(.025,0.05,'Isotropic Turbulence','HorizontalAlignment','left','Color','black','FontSize',14);
text(0.05,0.2,'Axisymetric','HorizontalAlignment','left','Color','black','FontSize',14);
text(-.05,0.6,'Two-Component','HorizontalAlignment','left','Color','black','FontSize',14);
text(.1,0.65,'One Component','HorizontalAlignment','left','Color','black','FontSize',14);
text(-.075,0.3,'Isotropic Two Component','HorizontalAlignment','left','Color','black','FontSize',14);

%------------------------------------------------
%Plot the LinesRD that show the legend 

