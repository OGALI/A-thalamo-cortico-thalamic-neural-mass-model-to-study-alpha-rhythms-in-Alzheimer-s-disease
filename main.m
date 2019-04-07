fs = 250;
t = corticaloutput.time;


figure
[pxx,f] = pwelch(corticaloutput.signals.values,500,300,500,fs);
plot(f,10*log10(pxx))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

figure
[pxx,f] = pwelch(thalamicoutput.signals.values,500,300,500,fs);
plot(f,10*log10(pxx))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')