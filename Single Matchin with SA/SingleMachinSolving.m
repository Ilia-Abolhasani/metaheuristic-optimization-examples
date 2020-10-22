clc;
clear all;
model=SingleMachin();
costfunction=@(q)cost(q,model);
maxgen=100;
maxgen2=10;
T0=50;
alpha=0.97;
x.Position=RandomSolution(model);
[x.Cost x.Sol]=costfunction(x.Position);
BestSol=x;
BestCost=zeros(maxgen,1);
T=T0;
for gen=1:maxgen
    for gen2=1:maxgen2
        xnew.Position=SolNeighbor(x.Position);
       [xnew.Cost xnew.Sol]=costfunction(xnew.Position);
       if (xnew.Cost<=x.Cost)
           x=xnew;
       else
           delta=xnew.Cost-x.Cost;
           p=exp(-delta/T);
           h=rand();
           if(p>=h)
                  x=xnew;
           end
       end
       if(x.Cost <=BestSol.Cost)
           BestSol=x;
       end       
    end
    BestCost(gen)=BestSol.Cost;
    T=alpha*T;    
end
plot(BestCost);
BestCost=sort(BestCost);
BestCost(1)