clear all;

Rp = 0.3;
Rs = 60;

wp = 30000*2*pi;
ws = 60000*2*pi;

Fs = 300000;
Ts = 1/Fs;

wp1 = wp*Ts;
ws1 = ws*Ts;

%prewarp
wp2 = 2*Fs*tan(wp1/2);
ws2 = 2*Fs*tan(ws1/2);

[N,Wn] = buttord(wp2,ws2,Rp,Rs,'s'); %order/wc

[Z,P,K] = buttap(N); %zero/pole/gain

[Bap,Aap] = zp2tf(Z,P,K); %zero/pole to transfer function B/A

[b,a] = lp2lp(Bap,Aap,Wn); %Change cutoff frequency for lowpass analog filter

[bz,az] = bilinear(b,a,Fs); %analog to digital

[H,W] = freqz(bz,az);

subplot(2,1,1);
plot(W/pi,db(abs(H)));
grid;
xlabel('normalized frequency (π rad/sample)');
ylabel('Mag(dB)');

subplot(2,1,2);
plot(W/pi,angle(H));
grid;
xlabel('normalized frequency (π rad/sample)');
ylabel('rad');