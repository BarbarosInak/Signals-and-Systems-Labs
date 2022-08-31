function ans = barbaros_inak(x,h)

l=1:length(x)*2-1;
k=1:length(x);

ans=zeros(1,2*length(x)-1);

x_new=zeros(1,length(x)*3);
x_new(1,length(x)+1:length(x)*2)=x;


h_new=zeros(1,2*length(h));
h_new(1,length(h)+1:length(h)*2)=h;
h_new=flip(h_new);

for i=l
    sum=0;
    for j=k
        if length(x)-i>=0
            sum=sum+x_new(length(x)+j)*h_new(length(x)-i+j);
        else
            sum=sum+x_new(j+i)*h_new(j);
        end
    ans(i)=sum;
    end
end
end