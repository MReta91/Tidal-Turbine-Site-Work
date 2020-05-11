ratio=1.26;
Dx=1.5;
Dy=1.5;
Cw=0.544;
Dza=diff(Za);
Dza=[(Dza(1,1)/ratio);Dza(1:end)];
Dzb=diff(Zb);
Dzb=[(Dzb(1,1)/ratio);Dzb(1:end)];
Dzc=diff(Zc);
Dzc=[(Dzc(1,1)/ratio);Dzc(1:end)];
Dzd=diff(Zd);
Dzd=[(Dzd(1,1)/ratio);Dzd(1:end)];
PA=abs(-((uwpAM.*LaIm./Dza')+(vwpAM.*LaJm./Dza')));
PB=abs(-((uwpBM.*LbIm./Dzb')+(vwpBM.*LbJm./Dzb')));
PC=abs(-((uwpCM.*LcIm./Dzc')+(vwpCM.*LcJm./Dzc')));
PD=abs(-((uwpDM.*LdIm./Dzd')+(vwpDM.*LdJm./Dzd')));

EA=(2.*Ka).^(1.5)./Lxxa;
EB=(2.*Kb).^(1.5)./Lxxb;
EC=(2.*Kc).^(1.5)./Lxxc;
ED=(2.*Kd).^(1.5)./Lxxd;

%Resolved TKE
kA=.5.*(uuprimeAM+vvprimeAM+wwprimeAM);
kB=.5.*(uuprimeBM+vvprimeBM+wwprimeBM);
kC=.5.*(uuprimeCM+vvprimeCM+wwprimeCM);
kD=.5.*(uuprimeDM+vvprimeDM+wwprimeDM);
%Dissipation 

Ka=.5*mean((uuprimeA+vvprimeA+wwprimeA));
Kb=.5*mean((uuprimeB+vvprimeB+wwprimeB));
Kc=.5*mean((uuprimeC+vvprimeC+wwprimeC));
Kd=.5*mean((uuprimeD+vvprimeD+wwprimeD));

Q2a=mean((uuprimeA+vvprimeA+wwprimeA));
Q2b=mean((uuprimeB+vvprimeB+wwprimeB));
Q2c=mean((uuprimeC+vvprimeC+wwprimeC));
Q2d=mean((uuprimeD+vvprimeD+wwprimeD));

Dx=1.5;
Dy=1.5;
VoA=Dx*Dy.*Dza;
VoB=Dx*Dy.*Dzb;
VoC=Dx*Dy.*Dzc;
VoD=Dx*Dy.*Dzd;
DeltaA=Cw.*(VoA.^(1/3));
DeltaB=Cw.*(VoB.^(1/3));
DeltaC=Cw.*(VoC.^(1/3));
DeltaD=Cw.*(VoD.^(1/3));

%-----------------------------------------------
%plot the production, dissipation rate and TKE
figure
grid on 
ax1 = subplot(1,3,1);
plot(ax1,Ka,Za./abs(min(Za)))
hold on 
plot(ax1,Kb,Zb./abs(min(Zb)))
plot(ax1,Kc,Zc./abs(min(Zc)))
plot(ax1,Kd,Zd./abs(min(Zd)))
xlabel({'Turbulent Kinetic Energy  (m^2/s^2)'},'Fontsize',12)
ylabel('Depth/H','Fontsize',12)
pbaspect([1 2 1])
%---------------------------------------

ax2 = subplot(1,3,2);
plot(ax2,PA,Za./abs(min(Za)))
hold on 
plot(ax2,PB,Zb./abs(min(Zb)))
plot(ax2,PC,Zc./abs(min(Zc)))
plot(ax2,PD,Zd./abs(min(Zd)))
xlabel({'Production '},'Fontsize',12)
ylabel('Depth/H','Fontsize',12)
pbaspect([1 2 1])
%-------------------------------------

ax3 = subplot(1,3,3);
plot(ax3,EA,Za./abs(min(Za)))
hold on 
plot(ax3,EB,Zb./abs(min(Zb)))
plot(ax3,EC,Zc./abs(min(Zc)))
plot(ax3,ED,Zd./abs(min(Zd)))
xlabel({'\epsilon Dissipation '},'Fontsize',12)
ylabel('Depth/H','Fontsize',12)
pbaspect([1 2 1])