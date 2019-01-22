Pns = 0.002:0.0001:1;
OSNRs = zeros(1,1000);
Qs = zeros(1,1000);
for i=1:1000
    result = soib(Pns(i));
    OSNRs(1,i) = result(1);
    Qs(1,i) = result(2);
end
    
figure(10);
title('Q(OSNR)');
semilogx(OSNRs, Qs);
