clear all;

Ap = 0.2;
Ast = 44;

wp = 3;
ws = 6;

Fs = 24/(2*pi);
Ts = 1/Fs;

Fp = wp*Ts;
Fst = ws*Ts;

N = 25;
alpha = (N-1)/2;
n = 0:1:N-1;
hd = (sin(Fp*(n-alpha+Ap))/(pi*(n-alpha+Ap)))
wh = hamming(N);
hn = wh'.*hd;
w = 0:0.01:pi;
h = freqz(hn,1,w);
figure(1)
plot(w/pi, db(abs(h)));
xlabel('frequency(π)');
ylabel('gain(dB)');
figure(2)
impz(hn,1);

wh = hann(N);
hn = wh'.*hd;
w = 0:0.01:pi;
h = freqz(hn,1,w);
figure(3)
plot(w/pi, db(abs(h)));
xlabel('frequency(π)');
ylabel('gain(dB)');
figure(4)
impz(hn,1);

wh = blackman(N);
hn = wh'.*hd;
w = 0:0.01:pi;
h = freqz(hn,1,w);
figure(5)
plot(w/pi, db(abs(h)));
xlabel('frequency(π)');
ylabel('gain(dB)');
figure(6)
impz(hn,1);



