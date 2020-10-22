function [Ans1 , Ans2]=Crossover(p)
%ArethmeticCrossover
n=size(p(1).Position,2);
Ans1=zeros(1,n);
Ans2=zeros(1,n);
for i=1:n
   Alpa=rand();
   Ans1(i)= Alpa*p(1).Position(i)+(1-Alpa)*p(2).Position(i);
   Ans2(i)= Alpa*p(2).Position(i)+(1-Alpa)*p(1).Position(i);
end
end