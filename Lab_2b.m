clear all;

Ap = 0.2;
Ast = 44;

wp = 3/(2*pi);
ws = 6/(2*pi);

Fs = 24/(2*pi);
Ts = 1/Fs;
Fp = 3*Ts;

dev = [(10^(Ap/20)-1)/(10^(Ap/20)+1) 10^(-Ast/20)];
[N,Wn,beta,ftype] = kaiserord([wp ws],[1 0],dev,Fs);
alpha = (N-1)/2;

n = 0:1:N-1;
hd = (sin(Fp*(n-alpha+Ap))/(pi*(n-alpha+Ap)))

wh = kaiser(N,beta);
hn = wh'.*hd;
w = 0:0.01:pi;
h = freqz(hn,1,w);
figure(1)
plot(w/pi, db(abs(h)));
xlabel('frequency(π)');
ylabel('gain(dB)');

figure(2)
impz(hn,1);