clc
clear
close all

fundametal = rand(10,1);
overtone = 0.3*rand(5,1);
px = fundametal + [overtone; overtone];

x = repmat(px,[20,1]);

n = 0.2*randn(size(x));
xn = n+x;

for t = 1:40
    shift_x = zeros(size(xn));
    shift_x(t+1:end) = xn(1:end-t);
    
    amdf(t) = sum(abs(xn - shift_x));
end

plot(x,'b'), hold;
plot(xn,'r');
plot(n,'g');

figure(2);
plot(amdf)

20*log(psnr(xn,x))


