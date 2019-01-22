function [OSNR, Q] = soib(PN, deltaN, deltaFo, f, P1, EX)
if deltaN > deltaFo
  deltaN = deltaFo
end;
step = 0.00001;
B = [f-deltaN/2:step:f+deltaN/2];
Bod = [f-deltaFo/2:step:f+deltaFo/2];
Bextended = [f-deltaN:step:f+deltaN];
P0 = P1/EX;
noise_fun = @(x) PN*ones(1, length(x));

signal1 = zeros(1, length(B));
signal1(int32(length(B)/2)) = P1;
signal0 = zeros(1, length(B));
signal0(int32(length(B)/2)) = P0;
noise = noise_fun(B);

left_filtered_freq = find(abs(Bextended - (f-deltaFo/2)) < 0.000001);
right_filtered_freq = find(abs(Bextended - (f+deltaFo/2)) < 0.000001);

asease_od = conv(noise, noise)(left_filtered_freq:right_filtered_freq);
signal1_od = conv(signal1, noise)(left_filtered_freq:right_filtered_freq);
signal0_od = conv(signal0, noise)(left_filtered_freq:right_filtered_freq);

sigma1 = sqrt(sum((signal1_od + asease_od).*step));
sigma0 = sqrt(sum((signal0_od + asease_od).*step));

OSNR = 10*log10(P1/(deltaN*PN));
Q = (P1 - P0) / (sigma1 + sigma0);
