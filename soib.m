deltaN = 0.0175;
deltaFo = 0.0175; 
f = 229;
step = 0.00001;
B = [f-deltaN/2:step:f+deltaN/2];
Bod = [f-deltaFo/2:step:f+deltaFo/2];
Bextended = [f-deltaN:step:f+deltaN];
P1 = 1000;
PN = 2;
noise_fun = @(x) PN*ones(1, length(x));

signal = zeros(1, length(B));
signal(int32(length(B)/2)) = P1;
noise = noise_fun(B);

%noisySignal = signal + noise;
%semilogy(B, noisySignal, '*'); 
asease = conv(noise, noise);
asease_od = asease(find(abs(Bextended - (f-deltaFo/2)) < 0.000001):find(abs(Bextended - (f+deltaFo/2))<0.000001));
figure(1);
plot(Bod, asease_od);
title('ase - ase');
signalase1 = conv(signal, noise);
signal_od = signalase1(find(abs(Bextended - (f-deltaFo/2)) < 0.000001):find(abs(Bextended - (f+deltaFo/2))<0.000001));
figure(2);
title('signal(1) - ase');
plot(Bod, signal_od);