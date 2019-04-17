%% Raw Time series plot of the baseline (basab_thalamocorticothalamicCkt)
clear all, close all, clc;
load('precompiledRuns/InitialRun_250Hz_60s.mat')
t = corticaloutput.time;


figure
plot(t, thalamicoutput.signals.values,'Color',[0.6350 0.0780 0.1840], 'Linewidth',0.01)
title('Time Series of the Thalamic Output','fontsize',18)
ylabel('Potential (mV)','fontsize',14)
xlabel('Time, (s)','fontsize',14)
figure
plot(t, corticaloutput.signals.values,'Color',[0.6350 0.0780 0.1840],'Linewidth',0.01)
title('Time Series of the Cortical Output','fontsize',18)
ylabel('Potential (mV)','fontsize',14)
xlabel('Time, (s)','fontsize',14)



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
 title('Power spectra when Reducing Overall Connectivity','fontsize',18)

 
 %% Full module Decreased Input
clear all, close all, clc;
fs = 250;

figure
hold on
load('precompiledRuns/InitialRun_250Hz_60s.mat')
filtered = bandpass(thalamicoutput.signals.values, [1 50], fs)
[pxx f] = pwelch(filtered,1/2*fs,[],[],250);
pxx = abs(pxx)./mean(pxx);
plot(f,10*log10(pxx),'LineWidth', 3)

load('precompiledRuns/fullModuleSlow.mat')
filtered = bandpass(thalamicoutput.signals.values, [1 50], fs)
[pxx f] = pwelch(filtered,1/2*fs,[],[],250);
pxx = abs(pxx)./mean(pxx);
plot(f,10*log10(pxx),'LineWidth', 3)

xlim([0 20])

lgd = legend('Base value','Decrease in connectivity (75%)','Decrease in connectivity (50%)','location','best')
lgd.FontSize = 14;
xlabel('Frequency (Hz)','fontsize',14)
ylabel('Relative Power Density','fontsize',14)
 title({'Power Spectrum when Reducing Connectivity Between', 'Thalamic and Cortical Modules'},'fontsize',18)

  %% Full module Increased Input
clear all, close all, clc;
fs = 250;

figure
hold on
load('precompiledRuns/InitialRun_250Hz_60s.mat')
filtered = bandpass(thalamicoutput.signals.values, [1 50], fs)
[pxx f] = pwelch(filtered,1/2*fs,[],[],250);
pxx = abs(pxx)./mean(pxx);
plot(f,10*log10(pxx),'LineWidth', 3)

load('precompiledRuns/increasedConnectivity.mat')
filtered = bandpass(thalamicoutput.signals.values, [1 50], fs)
[pxx f] = pwelch(filtered,1/2*fs,[],[],250);
pxx = abs(pxx)./mean(pxx);
plot(f,10*log10(pxx),'LineWidth', 3)

xlim([0 20])

lgd = legend('Base value','Decrease in connectivity (125%)','location','best')
lgd.FontSize = 14;
xlabel('Frequency (Hz)','fontsize',14)
ylabel('Relative Power Density','fontsize',14)
 title({'Power Spectrum when Increasing Overall Connectivity'},'fontsize',18)

  %% Cortical Module Isolated Baseline
clear all, close all, clc;
fs = 250;

figure
hold on
load('precompiledRuns/isolatedCorticalBaseline.mat')
filtered = bandpass(corticaloutput.signals.values, [1 50], fs)
[pxx f] = pwelch(filtered,1/2*fs,[],[],250);
pxx = abs(pxx);
plot(f,10*log10(pxx),'LineWidth', 3)
