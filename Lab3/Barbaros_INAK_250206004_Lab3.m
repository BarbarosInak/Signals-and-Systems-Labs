%% Step_1
T=10;
dt=0.001;
f=0.2;
teta=6*dt;

t1=0:dt:5;
t2=5.001:dt:10;


first_int=-exp(-t1);

second_int=-sin(2*pi*f*t2+teta);

integral_of_x=[first_int second_int];

t=[0:dt:T];

%% Step_2 
x_cal=zeros(1,length(integral_of_x));
q=1;

while q<=length(integral_of_x)
    if q==1
        x_cal(q)=1;
    else
        x_cal(q)=(integral_of_x(q)-integral_of_x(q-1))/dt;
    end
    q=q+1;
end

%% Step_3

figure;
plot(t,integral_of_x);
xlabel("t");
ylabel("integral values");
title("integral of the x(t)");

hold on;

plot(t,x_cal);
xlabel("t");
ylabel("x(t)");
title("x(t)");

%% Step_4

x_cal_sqr=x_cal.*x_cal;
x_cal_sqr=x_cal_sqr*dt;
sum=0;
for q=1:length(x_cal)
    sum= sum+x_cal_sqr(q);
end 

right_calc=sum/T;

%% Step_5

k=-5000:1:5000;
c_k=zeros(1,length(k));
c_k_real=zeros(1,length(k));
c_k_im=zeros(1,length(k));


q=1;


for l=k
    sum_re=0;
    sum_im=0;
    for j=1:length(t)
        sum_re=sum_re+x_cal(j)*(cos(l*(pi/5)*(j*dt-1)))*dt;
        
        sum_im=sum_im+x_cal(j)*-1*sin(l*(pi/5)*(j*dt-1))*dt;
    end
    c_k_real(q)=sum_re/T;
    c_k_im(q)=sum_im/T;
    c_k(q)=sum_re/T+i*sum_im/T;
    q=q+1;
end

%% Step_6
left_calc=0;
c_k_real_sqr=c_k_real.*c_k_real;
c_k_im_sqr=c_k_im.*c_k_im;
for q=1:length(k)
    left_calc=left_calc+c_k_real_sqr(q)+c_k_im_sqr(q);
end


%% Step_7
clc;
fprintf("left calc:")
disp(left_calc);
fprintf("right calc:")
disp(right_calc);
fprintf("\nAs we can see from the differnce between these two results they are nearly equal.\n There is a little error but this happened because of the assumptions that I used.")

%% 

y=0:0.001:5;

y1=0:0.001:2;
y2=2.001:0.001:3.41;
y3=3.4101:0.001:5;

x1=ones(1,length(y1));
x1=x1*10;

x2=zeros(1,length(y2))
for i=1:1:length(y2)
    x2(i)=10-(5*(y2(i)-2)*(y2(i)-2));
end

x3=zeros(1,length(y3));

plot(y,[x1 x2 x3])
xlabel("Vin");
ylabel("Vo");
title("Vo-Vin");