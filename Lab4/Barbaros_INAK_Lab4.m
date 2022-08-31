%% part_1
clc;
load('matrix_Double.mat')
x_real=matrix_Double(:);

%% part_2
clc;
T=length(x_real);
dt=1;
t=1:dt:T;
k=-2000:1:2000;
c_k=zeros(1,length(k));

q=1;

for l=k
    sum=0;
    for j=t
        sum=sum+x_real(j)*(cos(l*(2*pi/T)*j)-1i*sin(l*(2*pi/T)*j))*dt;
    end
    c_k(q)=sum/T;
    q=q+1;
end

%

%% part_3
clc;

M1=100;
M2=500;
M3=1000;
M4=2000;

x1=zeros(1,length(t));
x2=zeros(1,length(t));
x3=zeros(1,length(t));
x4=zeros(1,length(t));

for g=t
    sum=0;
    for f=[((length(c_k)+1)/2)-M1:1:((length(c_k)+1)/2)+M1]  
        sum=sum+c_k(f)*(cos((f-((length(c_k)+1)/2))*(2*pi/T)*g)+1i*sin((f-((length(c_k)+1)/2))*(2*pi/T)*g));     
    end
    x1(g)=sum;
    
end
x1=real(x1);

for g=t
    sum=0;
    for f=[((length(c_k)+1)/2)-M2:1:((length(c_k)+1)/2)+M2]  
        sum=sum+c_k(f)*(cos((f-((length(c_k)+1)/2))*(2*pi/T)*g)+1i*sin((f-((length(c_k)+1)/2))*(2*pi/T)*g));     
    end
    x2(g)=sum;
    
end
x2=real(x2);

for g=t
    sum=0;
    for f=[((length(c_k)+1)/2)-M3:1:((length(c_k)+1)/2)+M3]  
        sum=sum+c_k(f)*(cos((f-((length(c_k)+1)/2))*(2*pi/T)*g)+1i*sin((f-((length(c_k)+1)/2))*(2*pi/T)*g));     
    end
    x3(g)=sum;
    
end
x3=real(x3);

for g=t
    sum=0;
    for f=[((length(c_k)+1)/2)-M4:1:((length(c_k)+1)/2)+M4]  
        sum=sum+c_k(f)*(cos((f-((length(c_k)+1)/2))*(2*pi/T)*g)+1i*sin((f-((length(c_k)+1)/2))*(2*pi/T)*g));     
    end
    x4(g)=sum;
    
end
x4=real(x4);

%% part_4
clc;
MSE1=0;
MSE2=0;
MSE3=0;
MSE4=0;

for j=t
    MSE1=MSE1+(x1(j)-real(x_real(j)))^2;
end

MSE1=MSE1/length(t);

for j=t
    MSE2=MSE2+(x2(j)-real(x_real(j)))^2;
end

MSE2=MSE2/length(t);

for j=t
    MSE3=MSE3+(x3(j)-real(x_real(j)))^2;
end

MSE3=MSE3/length(t);

for j=t
    MSE4=MSE4+(x4(j)-real(x_real(j)))^2;
end

MSE4=MSE4/length(t);

plot([M1 M2 M3 M4],[MSE1 MSE2 MSE3 MSE4]);
title('Graph of MSEs for Different k Values');
xlabel('Number of k');
ylabel('Mean Square Error');
legend('MSE');

fprintf('MSE1: %f\n',MSE1);
fprintf('MSE2: %f\n',MSE2);
fprintf('MSE3: %f\n',MSE3);
fprintf('MSE4: %f\n',MSE4);

%% part_5

[row, column]=size(matrix_Double);
figure
image_original=uint8(real((reshape(x_real,[row column])))); %vector to matrix toimage
imshow(image_original)

figure
image_approximated=uint8(real((reshape(x1,[row column])))); %vectorto matrix to image
imshow(image_approximated)

figure
image_approximated=uint8(real((reshape(x2,[row column])))); %vectorto matrix to image
imshow(image_approximated)

figure
image_approximated=uint8(real((reshape(x3,[row column])))); %vectorto matrix to image
imshow(image_approximated)

figure
image_approximated=uint8(real((reshape(x4,[row column])))); %vectorto matrix to image
imshow(image_approximated)