figure 
ax1 = subplot(1,3,1);
plot(ax1,mean(LinesRD(9).Velocities.Vj,1),LinesRD(9).Dimensions.Z./abs(min(LinesRD(9).Dimensions.Z)))
hold on 
plot(ax1,mean(LinesRD(8).Velocities.Vj,1),LinesRD(8).Dimensions.Z./abs(min(LinesRD(8).Dimensions.Z)))
plot(ax1,mean(LinesRD(2).Velocities.Vj,1),LinesRD(2).Dimensions.Z./abs(min(LinesRD(2).Dimensions.Z)),'Color','k')
plot(ax1,mean(LinesRD(6).Velocities.Vj,1),LinesRD(6).Dimensions.Z./abs(min(LinesRD(6).Dimensions.Z)))
ylabel('Depth/H','Fontsize',16)
title('Region 1')
legend('L1','L2','L3','L4')
pbaspect([1 1.5 1])
%---------------------------------------
ax2 = subplot(1,3,2);
plot(ax2,mean(LinesRD(3).Velocities.Vj,1),LinesRD(3).Dimensions.Z./abs(min(LinesRD(3).Dimensions.Z)))
hold on 
plot(ax2,mean(LinesRD(5).Velocities.Vj,1),LinesRD(5).Dimensions.Z./abs(min(LinesRD(5).Dimensions.Z)))
plot(ax2,mean(LinesRD(10).Velocities.Vj,1),LinesRD(10).Dimensions.Z./abs(min(LinesRD(10).Dimensions.Z)),'Color','k')
plot(ax2,mean(LinesRD(11).Velocities.Vj,1),LinesRD(11).Dimensions.Z./abs(min(LinesRD(11).Dimensions.Z)))
title('Region 2')
legend('L5','L6','L7','L8')
pbaspect([1 1.5 1])
%-------------------------------------
ax3 = subplot(1,3,3);
plot(ax3,mean(LinesRD(4).Velocities.Vj,1),LinesRD(4).Dimensions.Z./abs(min(LinesRD(4).Dimensions.Z)))
hold on 
plot(ax3,mean(LinesRD(7).Velocities.Vj,1),LinesRD(7).Dimensions.Z./abs(min(LinesRD(7).Dimensions.Z)))
plot(ax3,mean(LinesRD(1).Velocities.Vj,1),LinesRD(1).Dimensions.Z./abs(min(LinesRD(1).Dimensions.Z)),'Color','k')
plot(ax3,mean(LinesRD(12).Velocities.Vj,1),LinesRD(12).Dimensions.Z./abs(min(LinesRD(12).Dimensions.Z)))
title('Region 3')
legend('L9','L10','L11','L12')
pbaspect([1 1.5 1])
%-------------------------------------