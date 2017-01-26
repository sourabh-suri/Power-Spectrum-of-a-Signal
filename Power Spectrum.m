% Program for estimating PSD of two sinusoids plus noise
% Algorithm; 
% 1:Get the frequencies of the two sinusoidal waves
% 2:Get the sampling frequency 
% 3:Get the length of the sequence to be considered
% 4: Get the two FFT lengths for comparing the corresponding power spectral densities 
clc; 
closeall; 
clearall; 

f1=input('Enter the frequency of first sinusoid'); 
f2=input('Enter the frequency of second sinusoid'); 
fs=input('Enter the sampling frequency'); 
N=input('Enter the length of the input sequence'); 
N1=input('Enter the input FFT length 1'); 
N2=input('Enter the input FFT length 2');


%Generation of input sequence')

t=0:1/fs:1; 
x=2*sin(2*pi*f1*1)+3*sin(2*pi*f2*t)-randn(size(t)); 

%Generation of psd for two different FFT lengths
Pxx1=abs(fft(x,N1)).^2/(N+1); 
Pxx2=abs(fft(x,N2)).^2/(N+1); 

%Plot the psd; 
subplot(2,1,1); 
plot ((0:(N1-1))/N1*fs,10*log10(Pxx1)); 
xlabel('Frequency in Hz'); 
ylabel('Power spectrum in dB'); 
title('[PSD with FFT length,num2str(N1)]'); 

subplot (2,1,2); 
plot ((0:(N2-1))/N2*fs,10*log10(Pxx2)); 
xlabel('Frequency in Hz'); 
ylabel('Power spectrum in dB'); 
title('[PSD with FFT length,num2str(N2)]');
