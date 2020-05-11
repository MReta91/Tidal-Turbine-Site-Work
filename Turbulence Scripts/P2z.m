%2 point correlation in Z
Ns=3250;%Number of Samples
ZL=size(Zc);%number of samples in the x direction 
z1A=wprimeC(:,33);
for i=1:ZL;
for t=1:Ns;
top(t,i)=wprimeC(t,33)*wprimeC(t,i);
end
end
topmz=mean(top,1);
a=std(LcK(:,33));
for i=1:ZL;
b(i)=std(LcK(:,i));
bottomz(i)=a.*b(i);
end

Bnormz=topmz./bottomz;
zvector=abs(Zc(33,1)-Zc(:,1));
%figure
plot(zvector(33:end),Bnormz(33:end))
clear 'bottom','top','z1A';
hold on 
 L2pz=trapz(zvector(33:end),Bnormz(33:end))
