
%% Isolated thalamic output
clear all, close all, clc;
fs = 250;

figure
hold on
load('precompiledRuns/thalamicIsolated.mat')
filtered = bandpass(thalamicoutput.signals.values, [1 50], fs)
[pxx f] = pwelch(filtered,1/2*fs,[],[],250);
pxx = abs(pxx)./mean(pxx);
plot(f,10*log10(pxx),'LineWidth', 3)
 
load('precompiledRuns/thalamicIsolatedLow.mat')
filtered = bandpass(thalamicoutput.signals.values, [1 50], fs)
[pxx f] = pwelch(filtered,1/2*fs,[],[],250);
pxx = abs(pxx)./mean(pxx);
plot(f,10*log10(pxx),'LineWidth', 3)

load('precompiledRuns/lowRetina.mat')
filtered = bandpass(thalamicoutput.signals.values, [1 50], fs)
[pxx f] = pwelch(filtered,1/2*fs,[],[],250);
pxx = abs(pxx)./mean(pxx);
plot(f,10*log10(pxx),'LineWidth', 3)


xlim([0 20])
lgd = legend('Base value','Decrease in connectivity (75%)','Decrease in connectivity (50%)','location','best')
lgd.FontSize = 14;
xlabel('Frequency (Hz)','fontsize',14)
ylabel('Relative Power Density','fontsize',14)
 title('Power spectra analysis','fontsize',18)

 
 %% Isolated Cortical output
clear all, close all, clc;
load('precompiledRuns/thalamicIsolated.mat')
fs = 250;
t = thalamicoutput.time;


%% Thalamic output
clear all, close all, clc;
load('precompiledRuns/InitialRun_250Hz_60s.mat')
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

load('precompiledRuns/InitialRun_250Hz_60s.mat')
t = corticaloutput.time;

figure
hold on
[pxx,f] = pwelch(corticaloutput.signals.values,500,300,500,fs);
plot(f,10*log10(pxx))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

load('../precompiledRuns/lowConnectivity.mat')
[pxx,f] = pwelch(corticaloutput.signals.values,500,300,500,fs);
plot(f,10*log10(pxx))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
xlim([0,15])
legend('Basal', 'Low Connectivity')

