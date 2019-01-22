prompt = {'Receiver filter bandwidth [Thz]', 'Noises bandwidth [Thz]', 'Frequency [Thz]', 'P1 [mW]', 'EX'};
definput = {0.0175, 0.0175, 229, 1, 50};
[deltaFo, deltaN, f, P1, EX] = inputdlg(prompt, 'Input', 1, definput){:};
deltaFo = str2num(deltaFo);
deltaN = str2num(deltaN);
f = str2num(f);
P1 = str2num(P1);
EX = str2num(EX);
Pns = 0.02:0.001:1;
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
