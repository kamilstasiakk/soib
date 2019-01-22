deltaN = 0.0175;
deltaFo = 0.0175; 
f = 229;
step = 0.00001;
B = [f-deltaN/2:step:f+deltaN/2];
P1 = 1000;
PN = 2;
S = 0.7; %A/W
R = 100; %ohm
EX = 1000;
noise_fun = @(x) PN*ones(1, length(x));

signal = zeros(1, length(B));
signal(int32(length(B)/2)) = P1;
noise = noise_fun(B);

%noisySignal = signal + noise;
%semilogy(B, noisySignal, '*'); 
asease = conv(noise, noise);
figure(2);
plot(asease);
title('ase - ase');
xlabel('czêstotliwoœæ'); 
ylabel('Moc optyczna'); 
signalase1 = conv(signal, noise);
figure(3);
title('signal(1) - ase');
xlabel('czêstotliwoœæ'); 
ylabel('Moc optyczna'); 
plot(signalase1)

I1 = P1 * S;
P1el = I1*I1*R;
P0 = P1/EX;
I0 = P0 * S;
P0el = I0*I0*R;

OSNR = P1/deltaN*PN;

%rysowanie
%sygna³ + szum
figure(1);
title('sygna³ + szum ASE');
semilogy(B, signal, B, noise);
xlabel('czêstotliwoœæ'); 
ylabel('Moc optyczna'); 
