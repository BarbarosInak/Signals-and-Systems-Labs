%% Part 1_1
t1=0:0.001:0.999;

w1=sin(2*pi*3*t1);
w1=w1-2;

t2_part=0:0.001:0.099;
t2=1:0.001:1.999;

w2=gauspuls(t2_part);
w2_real=[w2 w2 w2 w2 w2 w2 w2 w2 w2 w2];

t3=2:0.001:2.999;
w3=cos(2*pi*5*t3);
w3=w3+2;

figure;
plot([t1 t2 t3],[w1 w2_real w3],'k','LineWidth',1.5);
title("x(t)");
%% Part 1-2
t4=-0.999:0.001:-0;

t5_part=-0:-0.001:-0.099;
t5=-1:-0.001:-1.999;

t6=-2.999:0.001:-2;

w4=sin(2*pi*3*t4+pi);
w4=w4-2;

w5=gauspuls(flip(t5_part));
w5_real=[w5 w5 w5 w5 w5 w5 w5 w5 w5 w5];

w6=cos(2*pi*5*t6);
w6=w6+2;

figure;
plot([t6 flip(t5) t4],[w6 w5_real w4],'k','LineWidth',1.5);
title("x(-t)");
%% Part 1-3
clc;

figure;
subplot(3,2,1);
plot(t1,w1-w4);
title("Calculation graph");
disp("As we can see from first calculation graph, the peak value is doubled. Due to that we can say sin function is an odd function.");
subplot(3,2,2);
plot(t1,w1,"k","LineWidth",1.5);
title("odd function");

subplot(3,2,3);
plot(t1,w2_real-flip(w5_real));
% In theorically we should obtain 0 from w2_real and w5_real but while
% creating it there are no any straigth lines, because of that this graph
% is not as we expected. For getting better wiev I flipped them.
disp("As expected we get a straight line at the 0 value. According to that we can say that gauspuls function is an even function.");
title("Calculation graph");
subplot(3,2,4);
plot(t2,w2_real);
title("even function");

subplot(3,2,5);
plot(t1,w3-flip(w6));
% like in the gausplot part this part has problem too. They should be equal
% but there is a little shift between values, because of that we are not
% seeing 0 line.For getting better wiev I flipped them.
title("Calculation graph");
disp("From third calculation graph we can say cos function is a even function."); 
subplot(3,2,6);
plot(t1,w3,"b","LineWidth",1.5);
title("even function");
%% Part 2
clc;

h0=1;
h1=0;
h2=1;
h3=0;
h4=1;

t=0:1/249:1;

w7=sin(2*pi*5*t);

total_time=[t t+1 t+2 t+3 t+4];
total_w1=[w7*h4 w7*h3 w7*h2 w7*h1 w7*h0];

subplot(4,1,1);
plot(total_time, total_w1,"LineWidth",1.5);
title("y1(t)");

w8=cos(2*pi*7*t);
total_w2=[w8*h4 w8*h3 w8*h2 w8*h1 w8*h0];

subplot(4,1,2);
plot(total_time, total_w2,"LineWidth",1.5);
title("y2(t)");

sum_w=total_w1+total_w2;

subplot(4,1,3);
plot(total_time, sum_w,"LineWidth",1.5);
title("sum of y1(t) and y2(t)");

w9=sin(2*pi*5*t)+cos(2*pi*7*t);
sum_input_w=[w9*h4 w9*h3 w9*h2 w9*h1 w9*h0];

subplot(4,1,4);
plot(total_time,sum_input_w,"LineWidth",1.5);
title("x(t)=x1(t)+x2(t)");
