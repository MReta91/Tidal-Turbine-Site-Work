figure 
ax1 = subplot(1,2,1);
plot(ax1,LinesEbb(9).TurbulenceValues.TurbulenceIntensity*100,LinesEbb(9).Dimensions.Z./abs(min(LinesEbb(9).Dimensions.Z)))
hold on 
plot(ax1,LinesEbb(10).TurbulenceValues.TurbulenceIntensity*100,LinesEbb(10).Dimensions.Z./abs(min(LinesEbb(10).Dimensions.Z)))
plot(ax1,LinesEbb(12).TurbulenceValues.TurbulenceIntensity*100,LinesEbb(12).Dimensions.Z./abs(min(LinesEbb(12).Dimensions.Z)),'Color','k')
ylabel('Depth/H','Fontsize',16)
title('Region 1')
legend('L1','L2','L3','L4')
pbaspect([1 1.5 1])
%---------------------------------------
ax2 = subplot(1,2,2);
plot(ax2,LinesEbb(9).TurbulenceValues.KineticEnergies.kd,LinesEbb(9).Dimensions.Z./abs(min(LinesEbb(9).Dimensions.Z)))
hold on 
plot(ax2,LinesEbb(10).TurbulenceValues.KineticEnergies.kd,LinesEbb(10).Dimensions.Z./abs(min(LinesEbb(10).Dimensions.Z)))
plot(ax2,LinesEbb(12).TurbulenceValues.KineticEnergies.kd,LinesEbb(12).Dimensions.Z./abs(min(LinesEbb(12).Dimensions.Z)),'Color','k')
title('Region 2')
legend('L5','L6','L7','L8')
pbaspect([1 1.5 1])
%-------------------------------------
ax3 = subplot(1,3,3);
plot(ax3,LinesEbb(9).TurbulenceValues.Dissipation,LinesEbb(9).Dimensions.Z./abs(min(LinesEbb(9).Dimensions.Z)))
hold on 
plot(ax3,LinesEbb(10).TurbulenceValues.Dissipation,LinesEbb(10).Dimensions.Z./abs(min(LinesEbb(10).Dimensions.Z)))
plot(ax3,LinesEbb(12).TurbulenceValues.Dissipation,LinesEbb(12).Dimensions.Z./abs(min(LinesEbb(12).Dimensions.Z)),'Color','k');

yyaxis right
ylabel('Production')
plot(ax3,LinesEbb(9).TurbulenceValues.Production,LinesEbb(9).Dimensions.Z./abs(min(LinesEbb(9).Dimensions.Z)))
plot(ax3,LinesEbb(10).TurbulenceValues.Production,LinesEbb(10).Dimensions.Z./abs(min(LinesEbb(10).Dimensions.Z)))
plot(ax3,LinesEbb(12).TurbulenceValues.Production,LinesEbb(12).Dimensions.Z./abs(min(LinesEbb(12).Dimensions.Z)),'Color','k');
title('Region 3')
legend('L9','L10','L11','L12')
pbaspect([1 1.5 1])
%-------------------------------------