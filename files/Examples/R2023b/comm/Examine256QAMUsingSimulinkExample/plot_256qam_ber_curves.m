%% Plot 256-QAM BER vs EbN0dB
% Helper script to generate EbN0 vs. BER curves plotting phase noise
% performance of 256-QAM for a frequency offset of 1000 Hz. This script
% generates the 'Display BER Plot' for the cm_commphasenoise model.
clear;
open_system('cm_commphasenoise');
%%
% Set the frequency offset to 1000 Hz in the Phase Noise block and 
% number of bits per symbol to 8 thoughout the model.
freqOffset = 1000;
Nbps = 8;
% Define EbNo and phase noise ranges for simulation and plotting.
EbNoRng=(20:0.5:23);
PhNoiseRng=-88:3:-76;
% Specify the target number of errors.
tgtMaxErr = 1000;
%%
% Sweep phase noise and EbNo ranges to generate results, then plot.
ber = zeros(length(PhNoiseRng),length(EbNoRng));
for ip=1:length(PhNoiseRng)
    phaseNoise = PhNoiseRng(ip);
    for ies=1:length(EbNoRng)
        EbN0 = EbNoRng(ies);
        sim('cm_commphasenoise')
        ber(ip,ies) = outputErr(1);
        nErr(ip,ies) = outputErr(2);
        nsamp(ip,ies) = outputErr(3);
    end
end

semilogy(EbNoRng,ber,'*-');
axis([EbNoRng(1) EbNoRng(end) 1e-6 1e-2])
xlabel('EbNo in dB')
ylabel('BER')
legend([num2str(PhNoiseRng(:)) repmat(' dBc/Hz', ...
    [length(PhNoiseRng),1])],'Location','southwest')
title(['256-QAM BER with Phase Noise Specified at ' num2str(freqOffset) ' Hz  Frequency Offset'])
hold off
grid on
close_system('cm_commphasenoise');