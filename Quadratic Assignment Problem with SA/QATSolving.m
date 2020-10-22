%%
close all;
clear all;
clc;
model=QAP();
costfunction=@(q)cost(q,model);
%% 
maxgen=3000;
T0=50;
alpha=0.98;
x.Position=RandomSolution(model);
x.Cost=costfunction(x.Position);
BestAllocation=x;
BestCost=zeros(maxgen,1);
T=T0;
%% SA main loop
for gen=1:maxgen
    xnew.Position=SolNeighbor(x.Position);
    xnew.Cost=costfunction(xnew.Position);       
    if (xnew.Cost <= x.Cost)
        x=xnew;
    else       
        delta=xnew.Cost-x.Cost;
        p=exp(-delta/T);
        h=rand();
        if(h<=p)
             x=xnew;            
        end
    end
    if(x.Cost<=BestAllocation.Cost)
        BestAllocation=x;
    end    
    BestCost(gen)=BestAllocation.Cost;
    T=alpha*T;
end

plot(BestCost);
BestAllocation.Position
BestAllocation.Cost