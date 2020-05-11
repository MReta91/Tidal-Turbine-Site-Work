%Pay a lot of attention to where the point is being used
% it will reflect in lamba(line20), and the filter size
%U=LaK(:,33);
%V=LaJ(:,33);
%W=LaK(:,33);
%Delta=DeltaA(33,1);
Fs=3;  % Sampling frequency of 50 kHz
%i=Number of Averaged Cycles
j=3;
L=floor(length(U)/i);
t=(0:L-1)/(Fs);
% Perform FFT analysis on the U-velocity signal and plot Amplitude spectrum
aFData=zeros(L,4);
for i=1:j;
aFData(:,i)=fft(U(1+(L*(i-1)):L*i));
end
aFData=mean(aFData,2);
n=L/2; % FFT will yield half the number of unique points
aFreq=Fs*(1:n)/n; % Frequency array (half the length of signal)
aFMag=abs(aFData(1:n)/L); % Normalized Magnitude array (half the length of
for i=1:j;
Power(:,i)=abs(fft(U(1+(L*(i-1)):L*i))).^2/L; %Power is the magnitude squared by L
end
Power=mean(Power,2);
Energy=Power/Fs;
%lamba=20*aFreq/Umean; %Remember to get Umean
figure
%ax2 = subplot(2,3,5);
%loglog(lamba,Energy)
loglog(aFreq,Energy(2:L/2+1))
title('Energy Density Spectrum')
xlabel ('\lambda (m)')
ylabel ('Energy, E(f) (=Power/frequency) (m2/s)')
%Plotting the -5/3
xtest=.3:.1:8;
ytest=exp(((-4/3)*log(xtest))+.7);
hold on 
loglog(xtest,ytest)
% loglog([Delta Delta], [0.00000001 1], 'r')
% loglog([2 2], [0.00000001 1], 'g')
% set(gca, 'XDir','reverse')
% grid
% xlim([.35 100])
us=std(U(:,48));
vs=std(V(:,48));
ws=std(W(:,48));
