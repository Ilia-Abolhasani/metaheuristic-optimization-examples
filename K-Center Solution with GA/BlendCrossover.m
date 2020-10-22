function [Ans1 , Ans2]=BlendCrossover(p,model)
n=model.NMjadid;
Ans1=zeros(1,2*n);
Ans2=zeros(1,2*n);
Alpa=0.5;
for i=1:n*2  
   D=abs(p(1).Position(i)-p(2).Position(i));
   Ans1(i)= min(p(1).Position(i),p(2).Position(i))-Alpa*D;     
   Ans2(i)= max(p(1).Position(i),p(2).Position(i))+Alpa*D;         
end
end