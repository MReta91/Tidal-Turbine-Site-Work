%Plotting from the LineStructure 
S1=Lines(9).TurbulenceValues.TurbulenceIntensity;
S2=Lines(8).TurbulenceValues.TurbulenceIntensity;
S3=Lines(2).TurbulenceValues.TurbulenceIntensity;
S4=Lines(6).TurbulenceValues.TurbulenceIntensity;

Za=Lines(9).Dimensions.Z;
Zb=Lines(8).Dimensions.Z;
Zc=Lines(2).Dimensions.Z;
Zd=Lines(6).Dimensions.Z;

figure
plot(S1*100,Za./abs(min(Za)),'LineWidth',1.5)
hold on 
plot(S2*100,Zb./abs(min(Zb)),'LineWidth',1.5)
plot(S3*100,Zc./abs(min(Zc)),'LineWidth',1.5,'Color',[0 0 0])
plot(S4*100,Zd./abs(min(Zd)),'LineWidth',1.5,'Color',[0 0.498039215803146 0])
xlabel({'Length Scale (m)'},'Fontsize',12)
ylabel('Depth/H','Fontsize',12)
title('Deep Probes')
legend('L1','L2','L3','L4')
xlim([0 25])



plot(Lines(1).TurbulenceValues.LengthScales(1,:)./Lines(8).Dimensions.Dz', Lines(8).Dimensions.Z./min(Lines(8).Dimensions.Z));
plot(Lines(8).TurbulenceValues.LengthScales(1,:)./Lines(1).Dimensions.Dz', Lines(8).Dimensions.Z./min(Lines(8).Dimensions.Z));
plot(Lines(8).TurbulenceValues.LengthScales(1,:)./Lines(8).Dimensions.Dz', Lines(8).Dimensions.Z./min(Lines(8).Dimensions.Z));
plot(Lines(8).TurbulenceValues.LengthScales(1,:)./Lines(8).Dimensions.Dz', Lines(8).Dimensions.Z./min(Lines(8).Dimensions.Z));