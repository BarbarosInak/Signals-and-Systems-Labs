%% 5.1 
clear all;
t=0:0.001:0.5;
Fs=1000;
fc=50;

t1=0:0.001:0.1;
t2=0.101:0.001:0.5;

xfirst=cos(2*pi*fc*t1);
xsecond=zeros(1,length(t2));

x=[xfirst xsecond];

figure;
plot(t,x);
xlabel('time');
ylabel('x(t)');
title('x(t) - time');

f_vector=linspace(-500,500,1024);

dt=0.001;

x_f=zeros(1,1024);

q=1;
for j=f_vector
    sum=0;
    for k=1:length(t)
        sum=sum+x(k)*(cos(2*pi*j*(k*0.001-0.001))-1i*sin(2*pi*j*(k*0.001-0.001)))*dt;
    end
    x_f(q)=sum;
    q=q+1;
end

ft_fft=abs(fft(x,1024))/1024;

figure;
subplot(2,1,1);
plot(f_vector,fftshift(ft_fft))
title("fft");

subplot(2,1,2);
plot(f_vector,abs(x_f));
title("x_f");

%% 5.2 
clear all;

Ts=0.001;
d=0.5;
t_vector=0:Ts:d;

t3=0:Ts:0.099;

x3=ones(1,length(t3));
x4=2*ones(1,length(t3));
x5=zeros(1,length(t3));
x9=zeros(1,length(t3)+1);

x2=[x3 x4 x5 x5 x9];

x6=ones(1,length(t3));
x7=2*ones(1,length(t3));
x8=zeros(1,length(t3));
x9=4*ones(1,length(t3)+1);

y=[x6 x7 x8 x7 x9];



X2=fft(x2,length(t_vector));

Y=fft(y,length(t_vector));

H= Y ./ X2 ;

h=ifft(H,length(t_vector));


figure;
subplot(3,1,1);
plot(t_vector,h);
ylabel('h(t)');
xlabel('Time');
title('Impulse Response');

subplot(3,1,2);
plot(t_vector,x2);
ylabel('x_2(t)');
xlabel('Time');
title('Input');

subplot(3,1,3);
plot(t_vector,y);
ylabel('y(t)');
xlabel('Time');
title('Output');

%if signal created as follows instead of given graph, the convolution will be equal 
%to y(t) and satisfies frequency domain convolution too.

%x6=ones(1,length(t3));
%x7=2*ones(1,length(t3));
%x8=zeros(1,length(t3));
%x9=4*ones(1,length(t3));

%y=[x6 x7 x8 x7 x9 0];

%after defining y(t) as follows both in frequency and time domain
%convolutin will apply. But, as I said before this graph is not which is
%given to us.
