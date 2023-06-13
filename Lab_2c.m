clear all;

Ap = 0.2;
Ast = 44;

wp = 3/(2*pi);
ws = 6/(2*pi);

Fs = 24/(2*pi);

dev = [(10^(Ap/20)-1)/(10^(Ap/20)+1) 10^(-Ast/20)];
[n,fo,ao,w] = firpmord([wp ws],[1 0],dev,Fs);
b = firpm(n,fo,ao,w);
[h,w] = freqz(b,1);
figure(1)
plot(w/pi,db(abs(h)))

figure(2)
impz(b,1);