%% Loading Matrix

load('LabSample.mat')

%% Preparations
Ts=1/Fs;

time_duration=Ts*length(x);

t=0:Ts:time_duration-Ts;

down_sampling_periods=[2 4 8];

imp_train_2=zeros(1,length(t));

imp_train_4=zeros(1,length(t));

imp_train_8=zeros(1,length(t));

for i=1:length(t);
    if mod(i,down_sampling_periods(1))==0
        imp_train_2(i)=1;
    end
    if mod(i,down_sampling_periods(2))==0
        imp_train_4(i)=1;
    end
    if mod(i,down_sampling_periods(3))==0
        imp_train_8(i)=1;
    end
end

%% Down Sampling

x_ds_2=x'.*imp_train_2;

x_ds_4=x'.*imp_train_4;

x_ds_8=x'.*imp_train_8;

%% Ploting
step=44100/350000;
f_vector=[-22050:step:22050-step];

figure;

subplot(2,2,1);
plot(f_vector,fftshift(abs(fft(x'))/length(x)));
ylabel('X(jw)');
xlabel('Frequency');
title('Original Signal');

subplot(2,2,2);
plot(f_vector,fftshift(abs(fft(x_ds_2))/length(x)));
ylabel('x ds 2(jw)');
xlabel('Frequency');
title('Down sampled signal by 2Ts');

subplot(2,2,3);
plot(f_vector,fftshift(abs(fft(x_ds_4))/length(x)));
ylabel('x ds 4(jw)');
xlabel('Frequency');
title('Down sampled signal by 4Ts');

subplot(2,2,4);
plot(f_vector,fftshift(abs(fft(x_ds_8))/length(x)));
ylabel('x ds 8(jw)');
xlabel('Frequency');
title('Down sampled signal by 8Ts');

%% Filter Creation

LPF_2_freqs=[0 0.49 0.52 1];
LPF_2_amps=[1 1 0 0];
LPF_2=firpm(200,LPF_2_freqs,LPF_2_amps);

LPF_4_freqs=[0 0.23 0.24 1];
LPF_4_amps=[1 1 0 0];
LPF_4=firpm(200,LPF_4_freqs,LPF_4_amps);

LPF_8_freqs=[0 0.13 0.14 1];
LPF_8_amps=[1 1 0 0];
LPF_8=firpm(200,LPF_8_freqs,LPF_8_amps);

%% Convolution Operation

y_2=conv(LPF_2, x_ds_2);

y_4=conv(LPF_4,x_ds_4);

y_8=conv(LPF_8,x_ds_8);

y_2=y_2(:,100:length(y_2)-101);

y_4=y_4(:,100:length(y_4)-101);

y_8=y_8(:,100:length(y_8)-101);

%% Sound function on sampled signals
sound(x,Fs);
pause(8);
sound(y_2,Fs);
pause(8);
sound(y_4,Fs);
pause(8);
sound(y_8,Fs);

%% Comments

% According to the sound function results, I can easily say that in 
% correlation with my expectations 2Fs is the best one. 2Fs contains the 
% greatest amount of the same values, due to that its voice quality is the 
% closest to the original one. The quality of the resultant signal depends 
% on the sampling point amount. If it gets higher, quality becomes better.

%% Additional MSE
clc;

N=length(x);
sum=0;
for i=1:length(x);
    sum=sum+(x(i)-x_ds_2(i))^2;
end

MSE_2=sum/N;

sum=0;

for i=1:length(x);
    sum=sum+(x(i)-x_ds_4(i))^2;
end

MSE_4=sum/N;

sum=0;

for i=1:length(x);
    sum=sum+(x(i)-x_ds_8(i))^2;
end

MSE_8=sum/N;

fprintf("MSE_2: %f \n",MSE_2);
fprintf("MSE_4: %f \n",MSE_4);
fprintf("MSE_8: %f \n",MSE_8);
