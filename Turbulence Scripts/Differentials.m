%Production and dissipation rates
ratio=1.26;

Cw=0.544;

%----------------------------------
RS=zeros(3,3,i);
for i=1:length(Zd)
RS(:,:,i)=[uuprimeDM(1,i) uvpDM(1,i) uwpDM(1,i);
           uvpDM(1,i) vvprimeDM(1,i) vwpDM(1,i); 
           uwpDM(1,i) vwpDM(1,i) wwprimeDM(1,i)];
end
%----------------------------------
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
%-----------------------------------
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




Pd11=uprime
Pij=[Pd11 Pd12 Pd13;
     Pd21 Pd22 Pd23;
     Pd31 Pd32 Pd33;];   
 
 figure
 plot(Lyya./DeltaA',Za./abs(min(Za)))
 hold on 
 plot(Lyyb./DeltaB',Zb./abs(min(Zb)))
plot(Lyyc./DeltaC',Zc./abs(min(Zc)))
plot(Lyyd./DeltaD',Zd./abs(min(Zd)))