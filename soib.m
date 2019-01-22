function result = soib( PN )
deltaN = 0.0175;
deltaFo = 0.0175; 
f = 229;
step = 0.00001;
B = [f-deltaN/2:step:f+deltaN/2];
Bod = [f-deltaFo/2:step:f+deltaFo/2];
Bextended = [f-deltaN:step:f+deltaN];
P1 = 1;
%PN = 0.1;
S = 0.7; %A/W
R = 100; %ohm
EX = 50;
noise_fun = @(x) PN*ones(1, length(x));

signal = zeros(1, length(B));
signal(int32(length(B)/2)) = P1;
noise = noise_fun(B);

%noisySignal = signal + noise;
%semilogy(B, noisySignal, '*'); 
asease = conv(noise, noise);
asease_od = asease(find(abs(Bextended - (f-deltaFo/2)) < 0.000001):find(abs(Bextended - (f+deltaFo/2))<0.000001));

signalase1 = conv(signal, noise);

signal_od = signalase1(find(abs(Bextended - (f-deltaFo/2)) < 0.000001):find(abs(Bextended - (f+deltaFo/2))<0.000001));


I1 = P1*S;
P1el = I1*I1*R;
P0 = P1/EX;
I0 = P0*S;
P0el = I0*I0*R;

OSNR = P1/(deltaN*PN);




sigma1 = sqrt(var(signal_od + asease_od));
sigma0 = sqrt(var(asease_od));

Q = (P1el - P0el) / (sigma1 + sigma0);

result = [OSNR, Q];
