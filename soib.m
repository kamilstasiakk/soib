deltaN = 0.0175;
deltaFo = 0.0175; 
f = 229;
step = 0.00001;
B = [f-deltaN/2:step:f+deltaN/2];
P1 = 1000;
PN = 2;
noise_fun = @(x) PN*ones(1, length(x));

signal = zeros(1, length(B));
signal(int32(length(B)/2)) = P1;
noise = noise_fun(B);

%noisySignal = signal + noise;
%semilogy(B, noisySignal, '*'); 
asease = conv(noise, noise);
figure(1);
plot(asease);
title('ase - ase');
signalase1 = conv(signal, noise);
figure(2);
title('signal(1) - ase');
plot(signalase1)