% Plot the U-velocity trace
Fs=5;  % Sampling frequency of 50 kHz
L=length(U); % Number of samples
t=(0:L-1)/(Fs); % Time vector
figure
grid on 
ax1 = subplot(2,3,1);
plot(ax1,t,U); % Plot the velocity trace
title('U-velocity trace');
ylabel('U-velocity (m/s)');
xlabel('time (s)');
% Perform FFT analysis on the U-velocity signal and plot Amplitude spectrum
aFData=fft(U); % Take FFT of U signal
n=L/2; % FFT will yield half the number of unique points
aFreq=Fs*(1:n)/n; % Frequency array (half the length of signal)
aFMag=abs(aFData(1:n)/L); % Normalized Magnitude array (half the length of
%signal)
%figure;
%semilogx(aFreq(2:n),aFMag(2:n)) % Plot frequency against magnitude
%title('Single-Sided Amplitude Spectrum of U(t)')
%xlabel('Frequency (Hz)')
%ylabel('|U(f)| (ft/s)')
% Plot the energy density spectrum
Power=abs(fft(U)).^2/L; %Power is the magnitude squared by L
Energy=Power/Fs;
ax2 = subplot(2,3,5);
loglog(ax2,aFreq,Energy(2:L/2+1))
title('Energy Density Spectrum')
xlabel ('Frequency (Hz)')
ylabel ('Energy, E(f) (=Power/frequency) (m2/s)')
%-------------------------------------------------------------------------
Fs=5;  % Sampling frequency of 50 kHz
L=length(V); % Number of samples
t=(0:L-1)/(Fs); % Time vector
grid on 

ax3 = subplot(2,3,2);
plot(ax3,t,V); % Plot the velocity trace
title('V-velocity trace');
ylabel('V-velocity (m/s)');
xlabel('time (s)');
% Perform FFT analysis on the U-velocity signal and plot Amplitude spectrum
aFData_v=fft(V); % Take FFT of U signal
n=L/2; % FFT will yield half the number of unique points
aFreq_v=Fs*(1:n)/n; % Frequency array (half the length of signal)
aFMag_v=abs(aFData_v(1:n)/L); % Normalized Magnitude array (half the length of
%signal)
%figure;
%semilogx(aFreq(2:n),aFMag(2:n)) % Plot frequency against magnitude
%title('Single-Sided Amplitude Spectrum of U(t)')
%xlabel('Frequency (Hz)')
%ylabel('|U(f)| (ft/s)')
% Plot the energy density spectrum
Power_v=abs(fft(V)).^2/L; %Power is the magnitude squared by L
Energy_v=Power_v/Fs;
ax4 = subplot(2,3,4);
loglog(ax4,aFreq_v,Energy_v(2:L/2+1))
title('Energy Density Spectrum')
xlabel ('Frequency (Hz)')
ylabel ('Energy, E(f) (=Power/frequency) (m2/s)')

%-------------------------------------------------------------------------

Fs=5;  % Sampling frequency of 50 kHz
L=length(W); % Number of samples
t=(0:L-1)/(Fs); % Time vector
grid on 

ax5 = subplot(2,3,3);
plot(ax5,t,W); % Plot the velocity trace
title('W-velocity trace');
ylabel('W-velocity (m/s)');
xlabel('time (s)');
% Perform FFT analysis on the U-velocity signal and plot Amplitude spectrum
aFData_w=fft(W); % Take FFT of U signal
n=L/2; % FFT will yield half the number of unique points
aFreq_w=Fs*(1:n)/n; % Frequency array (half the length of signal)
aFMag_w=abs(aFData_w(1:n)/L); % Normalized Magnitude array (half the length of
%signal)
%figure;
%semilogx(aFreq(2:n),aFMag(2:n)) % Plot frequency against magnitude
%title('Single-Sided Amplitude Spectrum of U(t)')
%xlabel('Frequency (Hz)')
%ylabel('|U(f)| (ft/s)')
% Plot the energy density spectrum
Power_w=abs(fft(W)).^2/L; %Power is the magnitude squared by L
Energy_w=Power_w/Fs;
ax6 = subplot(2,3,6);
loglog(ax6,aFreq_w,Energy_w(2:L/2+1))
title('Energy Density Spectrum')
xlabel ('Frequency (Hz)')
ylabel ('Energy, E(f) (=Power/frequency) (m2/s)')





%-------------------------------------------------------------------------
 
% Calculate the integral length scale (macro scale) Roach Eqn 15
uprime=std(U);
uprimesquared=uprime^2;
Ubar=mean(U);
Tu=uprime/Ubar;
Ef0=mean(Energy(2:100));
IntegralLengthScale=Ef0*mean(U)/(4*uprimesquared);
% Calculate the dissipation length scale (micro scale) Roach Eqn 8
for i=1:length(aFreq)
 Y(i)=aFreq(i)*aFreq(i)*Energy(i);
end
Z=trapz(aFreq,Y); % Use trapezoid rule for integration
Z=Z*2*pi^2/(Ubar^2*uprimesquared);
DissipationScale=sqrt(1/Z);



