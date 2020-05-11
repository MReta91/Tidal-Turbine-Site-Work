function [fVect, SD] = DownSampleFFT(TSe,sf,nb,nm)
%produces non-normalised spectral density data with linearly spaced
%frequency vector in log scale.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inputs:
%TSe: array of real: input time series
%sf: integer: sampling frequency of the time series
%nb: integer: desired number of bins in the log scale
%nm: integer: number of frequency components over which average is computed
%for when at low frequency the frequency resolution is too coarse and
%produces empty log bins.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%outputs:
%fVect: array of real: frequency vector of the spectrum
%SD: array of real: spectrum data

N = length(TSe);

df = sf/N;

TSe = TSe - mean(TSe);

fftVect = fft(TSe);

V = (1/(sf * N)) * abs(fftVect(1:N/2+1)).^2;
V(2:end-1) = 2 * V(2:end-1);

f = 0:df:sf/2;

V = reshape(V,[1 length(V)]);
f = reshape(f,[1 length(f)]);

f2=[log10(f(2)) max(log10(f))];
f3=f2(1):[f2(2)-f2(1)]/nb:f2(2);
f3c=f3(1:end-1)+diff(f3)/2;
f4 = 10.^f3;
f4(end) = f(end);
f4c = 10.^f3c;
Vc = zeros(size(f4c));

for k = 1:length(f4c);
    iiwin = intersect(find(f>f4(k)),find(f<f4(k+1)));
    iiwin = [min(iiwin)-1:max(iiwin)+1];
    Vc(k) = mean(V(iiwin));
end

nmax = find(isnan(Vc)==1,1,'last')+1;
ipos = find(f < f4c(nmax));
n = floor(length(ipos)/nm);
r = rem(length(ipos),nm);


if n == 0
    if r == 0
       fVect = f4c(nmax:end);
       SD = Vc(nmax:end);
    else
       fVect = [f(1:r) f4c(nmax:end)]; 
       SD = [V(1:r) Vc(nmax:end)];
    end
else
    for kk = 1:n
        f5(kk) = mean(f(nm*(kk-1)+r+1:nm*(kk)+r));
        V5(kk) = mean(V(nm*(kk-1)+r+1:nm*(kk)+r));
    end

    if r == 0
       fVect = [f5 f4c(nmax:end)];
       SD = [V5 Vc(nmax:end)];
    else
       fVect = [f(1:r) f5 f4c(nmax:end)]; 
       SD = [V(1:r) V5 Vc(nmax:end)];
    end
    
end


% fVect = [f(1:r) f4c(nmax:end)];
% SD = [V(ipos)' Vc(nmax:end)];
end

