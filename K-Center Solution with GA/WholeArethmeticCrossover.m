function [Ans1 , Ans2]=WholeArethmeticCrossover(p,model)
Alpa=rand();
n=model.NMjadid;
Ans1=zeros(1,2*n);
Ans2=zeros(1,2*n);
for i=1:n*2
   Ans1(i)= Alpa*p(1).Position(i)+(1-Alpa)*p(2).Position(i);
   Ans2(i)= Alpa*p(2).Position(i)+(1-Alpa)*p(1).Position(i);
end
end