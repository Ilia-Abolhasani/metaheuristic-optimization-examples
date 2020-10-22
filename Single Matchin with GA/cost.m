function [z,sol]=cost(q,model)
I=model.I;
P=model.P;
D=model.D;
ST=zeros(I,1);
FT=zeros(I,1);
Tardi=zeros(I,1);
for i=q
    k=find(q==i);
    if(k==1)
        ST(i)=0;
    else
        ST(i)=FT(q(k-1));
    end
    FT(i)=ST(i)+P(i);
    Tardi(i)=max(FT(i)-D(i),0);
end
SumofTardi=sum(Tardi);
sol.ST=ST;
sol.FT=FT;
sol.P=P;
sol.D=D;
sol.Tardi=Tardi;
z=SumofTardi;
end