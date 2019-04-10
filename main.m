%clear all,
close all, clc;

fs = 250;
t = corticaloutput.time;

%% Thalamic output
clear all, close all, clc;
load('InitialRun_250Hz_60s.mat')
fs = 250;
t = corticaloutput.time;

figure
pwelch(corticaloutput.signals.values)
plot(f,10*log10(pxx))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
% xlim([0 20])

figure
[b,a] = butter(10,[1 50]/(fs/2))
y = filter(b,a, corticaloutput.signals.values);
[pxx,f] = pwelch(y);
plot(f,10*log10(pxx))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

%% Cortical output
clear all, close all, clc
fs = 250;

load('InitialRun_250Hz_60s.mat')
t = corticaloutput.time;

figure
hold on
[pxx,f] = pwelch(corticaloutput.signals.values,500,300,500,fs);
plot(f,10*log10(pxx))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

load('lowConnectivity.mat')
[pxx,f] = pwelch(corticaloutput.signals.values,500,300,500,fs);
plot(f,10*log10(pxx))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
xlim([0,15])
legend('Basal', 'Low Connectivity')

