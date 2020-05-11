%Autocor
%Line a
for i=1:length(Za)
AcUa(:,i)=autocorr(LaI(:,i));
dt=.2;
Tixxa(i)=trapz(AcUa(:,i))*dt;
Lxxa(i)=Tixxa(i)*LaIm(1,i);
end
for i=1:length(Za)
AcVa(:,i)=autocorr(LaJ(:,i)); 
Tiyya(i)=trapz(AcVa(:,i))*dt;
Lyya(i)=Tiyya(i)*LaJm(1,i);
end
for i=1:length(Za)
AcWa(:,i)=autocorr(LaK(:,i));
Tizza(i)=trapz(AcWa(:,i))*dt;
Lzza(i)=Tizza(i)*LaKm(1,i);
end
%Line B
for i=1:length(Zb)
AcUb(:,i)=autocorr(LbI(:,i));
dt=.2;
Tixxb(i)=trapz(AcUb(:,i))*dt;
Lxxb(i)=Tixxb(i)*LbIm(1,i);
end
for i=1:length(Zb)
AcVb(:,i)=autocorr(LbJ(:,i));
Tiyyb(i)=trapz(AcVb(:,i))*dt;
Lyyb(i)=Tiyyb(i)*LbJm(1,i);
end
for i=1:length(Zb)
AcWb(:,i)=autocorr(LbK(:,i));
Tizzb(i)=trapz(AcWb(:,i))*dt;
Lzzb(i)=Tizzb(i)*LbKm(1,i);
end
%Line C
for i=1:length(Zc)
AcUc(:,i)=autocorr(LcI(:,i));
dt=.2;
Tixxc(i)=trapz(AcUc(:,i))*dt;
Lxxc(i)=Tixxc(i)*LcIm(1,i);
end
for i=1:length(Zc)
AcVc(:,i)=autocorr(LcJ(:,i));
Tiyyc(i)=trapz(AcVc(:,i))*dt;
Lyyc(i)=Tiyyc(i)*LcJm(1,i);
end
for i=1:length(Zc)
AcWc(:,i)=autocorr(LcK(:,i));
Tizzc(i)=trapz(AcWc(:,i))*dt;
Lzzc(i)=Tizzc(i)*LcKm(1,i);
end
%Line D
for i=1:length(Zd)
AcUd(:,i)=autocorr(LdI(:,i));
dt=.2;
Tixxd(i)=trapz(AcUd(:,i))*dt;
Lxxd(i)=Tixxd(i)*LdIm(1,i);
end
for i=1:length(Zd)
AcVd(:,i)=autocorr(LdJ(:,i));
Tiyyd(i)=trapz(AcVd(:,i))*dt;
Lyyd(i)=Tiyyd(i)*LdJm(1,i);
end
for i=1:length(Zd)
AcWd(:,i)=autocorr(LdK(:,i));
Tizzd(i)=trapz(AcWd(:,i))*dt;
Lzzd(i)=Tizzd(i)*LdKm(1,i);
end