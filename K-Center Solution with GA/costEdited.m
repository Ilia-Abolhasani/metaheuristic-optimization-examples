function cost=costEdited(q,model)
w=model.w;
v=model.v;
p1=model.p1;
p2=model.p2;
n=model.NMjadid;
m=model.Nmachin;
x=zeros(n,n);
for i=1:2:2*n
    for j=i+2:2:2*n
        x(floor(i/2)+1,floor(j/2)+1)=q(i)-q(j);
        x(floor(j/2)+1,floor(i/2)+1)=x(floor(i/2)+1,floor(j/2)+1);
    end
end
y=zeros(n,n);
for i=2:2:2*n
    for j=i+2:2:2*n
        y(i/2,j/2)=q(i)-q(j);
        y(j/2,i/2)=y(i/2,j/2);
    end
end
Dv=zeros(n,n);
for i=1:n-1
   for j=i+1:n
       Dv(i,j)=sqrt(x(i,j)^2+y(i,j)^2);
       Dv(j,i)=Dv(i,j);
   end
end
a=zeros(n,m);
for i=1:n
    for j=1:m
        a(i,j)=p1(j)-q(i*2-1);
    end
end
b=zeros(n,m);
for i=1:n
    for j=1:m
        b(i,j)=p2(j)-q(i*2);
    end
end
Dw=zeros(n,m);
for i=1:n
    for j=1:m
        Dw(i,j)=sqrt(a(i,j)^2+b(i,j)^2);
    end
end

VD=0;
for i=1:n-1
    for j=i+1:n
        VD=VD+(Dv(i,j)*v(i,j));
    end
end
WD=0;
for i=1:n
    for j=1:m
        WD=WD+(Dw(i,j)*w(i,j));
    end
end
cost=VD+WD;
end