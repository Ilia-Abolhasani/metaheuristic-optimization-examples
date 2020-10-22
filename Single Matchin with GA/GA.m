clear all;
close all;
clc;
model=SingleMachin();
costfunction=@(q)cost(q,model);
nvar=model.I;
maxgen=50;
npop=10;
Ps=0.4;
ns=round(Ps*npop);
Pi=0.5;
ni=round(Pi*npop);
Pr=0.3;
nr=round(Pr*npop);
Ps2=0.3;
ns2=round(Ps2*npop);
individual.Position=[];
individual.Cost=[];
pop=repmat(individual,npop,1);
for i=1:npop
    pop(i).Position=RandomSolution(model);
    pop(i).Cost=costfunction(pop(i).Position);
end
BestCost=zeros(maxgen,1);
%main loop
for gen=1:maxgen
    pops=repmat(individual,ns,1);
    for k=1:ns
        i=randsample(1:npop,1);
        p=pop(i);
        pops(k).Position=Swap(p.Position);
        pops(k).Cost=costfunction(pops(k).Position);        
    end
    popi=repmat(individual,ni,1);
    for k=1:ni
        i=randsample(1:npop,5);
        pop2=pop(i);
        [sortedcost locationsortedcost]=sort([pop2.Cost]);
        sortpopulation2=pop2(locationsortedcost);
        p=sortpopulation2(1);        
        popi(k).Position=Insertion(p.Position);
        popi(k).Cost=costfunction(popi(k).Position);        
    end
    popr=repmat(individual,nr,1);
    for k=1:nr
        i=randsample(1:npop,1);
        p=pop(i);
        popr(k).Position=Reversion(p.Position);
        popr(k).Cost=costfunction(popr(k).Position);
    end
    pops2=repmat(individual,ns2,1);
    POP=pop;
    [sortedcost locatofsortedcost]=sort([POP.Cost]);
        sortpopulation=POP(locatofsortedcost);        
        p=POP(1:ns2);
    for k=1:ns2
       pops2(k).Position=scramble(p(k).Position);
       pops2(k).Cost=costfunction(pops2(k).Position);
    end
    pop=[pop
        pops
        popr
        popi
        pops2];
    costs=[pop.Cost];
    [costs locateofsortedcost]=sort(costs);
    pop=pop(locateofsortedcost);
    pop=pop(1:npop);
    BestCost(gen)=pop(1).Cost;    
end
BestCost
plot(BestCost);
