prompt = {'Receiver filter bandwidth [Thz]', 'Noises bandwidth [Thz]', 'Frequency [Thz]', 'P1 [mW]',
          'EX', 'OSNR_min [db]', 'OSNR_max [db]', 'OSNRs counts'};
definput = {0.0175, 0.0175, 229, 1, 50, 15, 35, 500};
[deltaFo, deltaN, f, P1, EX, OSNR_min, OSNR_max, counts] = inputdlg(prompt, 'Input', 1, definput){:};
deltaFo = str2num(deltaFo);
deltaN = str2num(deltaN);
f = str2num(f);
P1 = str2num(P1);
EX = str2num(EX);
OSNR_min = str2num(OSNR_min);
OSNR_max = str2num(OSNR_max);
Pn_min = P1/((10^(OSNR_min/10)) * deltaN);
Pn_max = P1/((10^(OSNR_max/10)) * deltaN);
counts = str2num(counts);
Pns = linspace(Pn_min, Pn_max, counts);
OSNRs = zeros(1, length(Pns));
Qs = zeros(1, length(Pns));
for i=1:length(Pns)
    [OSNRs(1,i), Qs(1,i)] = soib(Pns(i), deltaN, deltaFo, f, P1, EX);
end


plot(OSNRs, Qs);
figure(1);
title('Q(OSNR)');
xlabel('OSNR[dB]');
ylabel('Q factor');
