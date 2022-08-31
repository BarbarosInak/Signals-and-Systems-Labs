%% Lab Work

Fs=1000;
Ts=1/Fs;

t=0:Ts:0.5;

x1=sin(200*pi*t);
x2=2*sin(400*pi*t);
x3=0.5*sin(600*pi*t);
x=x1+x2+x3;

LPFfreqs=[0 0.3 0.4 1];
LPFamps=[1 1 0 0];
LPF=firpm(100,LPFfreqs,LPFamps);
y1=filter(LPF,1,x);

BPFfreqs=[0 0.2 0.3 0.5 0.6 1];
BPFamps=[0 0 1 1 0 0];
BPF=firpm(100,BPFfreqs,BPFamps);
y2=filter(BPF,1,x);

HPFfreqs=[0 0.4 0.5 1];
HPFamps=[0 0 1 1];
HPF=firpm(100,HPFfreqs,HPFamps);
y3=filter(HPF,1,x);

%% Frequency Response

figure;
freqz(LPF);
title('LPF');

figure;
freqz(BPF);
title('BPF');

figure;
freqz(HPF);
title('HPF');

%% Plotting
figure;

subplot(4,2,1);
plot(t,x);
ylabel('Amplitude');
xlabel('Time');
title('Original Signal');

subplot(4,2,2);
plot(t,y1);
ylabel('Amplitude');
xlabel('Time');
title('LPF Applied on X(t)');

subplot(4,2,3);
plot(t,y2);
ylabel('Amplitude');
xlabel('Time');
title('BPF Applied on X(t)');

subplot(4,2,4);
plot(t,y3);
ylabel('Amplitude');
xlabel('Time');
title('HPF Applied on X(t)');

f_vector=[-500:1:500];

subplot(4,2,5);
plot(f_vector,fftshift(abs(fft(x,length(f_vector))/length(t))));
ylabel('Amplitude');
xlabel('Frequency');
title('X(jw)');


subplot(4,2,6);
plot(f_vector,fftshift(abs(fft(y1,length(f_vector)))/length(t)));
ylabel('Amplitude');
xlabel('Frequency');
title('LPF Applied Version of X(jw)');

subplot(4,2,7);
plot(f_vector,fftshift(abs(fft(y2,length(f_vector)))/length(t)));
ylabel('Amplitude');
xlabel('Frequency');
title('BPF Applied Version of X(jw)');

subplot(4,2,8);
plot(f_vector,fftshift(abs(fft(y3,length(f_vector)))/length(t)));
ylabel('Amplitude');
xlabel('Frequency');
title('HPF Applied Version of X(jw)');

%% Ideal Filters

ideal_LPF=[ones(1,150) zeros(1,length(t)-150)];

ideal_BPF=[zeros(1,149) ones(1,250-149) zeros(1,length(t)-250)];

ideal_HPF=[zeros(1,249) ones(1,length(t)-249)];
half_f_vector=[0:1:500];

figure;

subplot(3,1,1);
plot(half_f_vector,ideal_LPF);
ylabel('Amplitude');
xlabel('Frequency');
title('Ideal LPF');

subplot(3,1,2);
plot(half_f_vector,ideal_BPF);
ylabel('Amplitude');
xlabel('Frequency');
title('Ideal BPF');

subplot(3,1,3);
plot(half_f_vector,ideal_HPF);
ylabel('Amplitude');
xlabel('Frequency');
title('Ideal HPF');
