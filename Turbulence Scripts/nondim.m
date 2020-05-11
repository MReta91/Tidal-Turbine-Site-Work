%See the velocity at Y+ scale
ut=.01;
rho=997;
mu=.00087;
y9=cumsum(LinesRD(9).Dimensions.Dz);
yp9=y9.*(ut*rho/mu);
up9=mean(LinesRD(9).Velocities.Magnitude)./ut;
%--------
y3=cumsum(LinesRD(3).Dimensions.Dz);
yp3=y3.*(ut*rho/mu);
up3=mean(LinesRD(3).Velocities.Magnitude)./ut;
%--------
y4=cumsum(LinesRD(4).Dimensions.Dz);
yp4=y4.*(ut*rho/mu);
up4=mean(LinesRD(4).Velocities.Magnitude)./ut;
%--------
y10=cumsum(LinesRD(10).Dimensions.Dz);
yp10=y10.*(ut*rho/mu);
up10=mean(LinesRD(10).Velocities.Magnitude)./ut;
%--------
figure
loglog(yp9,up9)
hold on 
loglog(yp3,up3)
loglog(yp4,up4)
loglog(yp10,up10)