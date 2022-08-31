%% Part-1
clc;
t=1:39;
x=randn(1,20);
h=randn(1,20);

y1=barbaros_inak(x,h);

y2=conv(x,h);

figure;
subplot(2,1,1)
stem(t,y1,"k")
title("y1")
xlabel("Time")
ylabel("Amplitude")

subplot(2,1,2)
stem(t,y2,"b")
title("y2")
xlabel("Time")
ylabel("Amplitude")

figure;
plot(y1,y2)
title("y1 and y2")
xlabel("y1")
ylabel("y2")

%% Part-2.a
clc;
close all;
t=-10:1:9;

subplot(3,1,1)
h1=gauspuls(t-1)+gauspuls(t+1);
stem(t,h1,"k","LineWidth",1)
title("h1")
xlabel("Time")
ylabel("Amplitude")

subplot(3,1,2)
h2=heaviside(t)-heaviside(t-4);
stem(t,h2,"r")
title("h2")
xlabel("Time")
ylabel("Amplitude")

subplot(3,1,3)
h3=gauspuls(t-1);
stem(t,h3,"r")
title("h3")
xlabel("Time")
ylabel("Amplitude")

%% Part-2.b
clc;
t=-10:1:9;
t2=-10:0.5:9;

x=cos(pi*t).*(heaviside(t)-heaviside(t-6));

y1_out=barbaros_inak(x,h1);

y2_out=conv(x,h2);

h3_new=gauspuls(t2-1);

x_new=y1_out+y2_out;
x_new_2=zeros(1,40);
x_new_2(1,1:39)=x_new;

h3_new_2=zeros(1,40);
h3_new_2(1,1:39)=h3_new;

t3=-10:0.25:9.5;

y_out=barbaros_inak(x_new_2,h3_new_2);
stem(t3,y_out);
xlabel("Time")
ylabel("Amplitude")