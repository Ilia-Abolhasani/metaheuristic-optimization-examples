%function Result=GeneticAlgorithm()
clear all;
close all;
clc;
%%problem Definition
model=MultiFacilityLauout();
costfunction=@(q)costEdited(q,model);
nvar=2*model.NMjadid;
%%GA Parameters
maxgen=1000;
npop=60;
Pb=0.40;
Nb=2*round((Pb*npop)/2);
Pa=0.23;
Na=2*round((Pa*npop)*2);
Pw=0.32;
Nw=2*round((Pw*npop)*2);
%%Initialization
individual.Position=[];
individual.Cost=[];
pop=repmat(individual,npop,1);
for i=1:npop
    pop(i).Position=RandomSolution(model);
    pop(i).Cost=costfunction(pop(i).Position);
end
BestCost=zeros(maxgen,1);
%%GA Main loop
for gen=1:maxgen    
    popb=repmat(individual,Nb,1);
    for k=1:2:Nb
        i=randsample(1:npop,2);
        p=pop(i);
        [Ans1 Ans2]=BlendCrossover(p,model);
        popb(k).Position=Ans1;
        popb(k+1).Position=Ans2;                 
        popb(k).Cost=costfunction(popb(k).Position);
        popb(k+1).Cost=costfunction(popb(k+1).Position);
    end
    popa=repmat(individual,Na,1);
    for k=1:2:Na
        i=randsample(1:npop,2);
        p=pop(i);
        [Ans1 Ans2]=ArethmeticCrossover(p,model);
        popa(k).Position=Ans1;
        popa(k+1).Position=Ans2;          
        popa(k).Cost=costfunction(popa(k).Position);
        popa(k+1).Cost=costfunction(popa(k+1).Position);
    end
    popw=repmat(individual,Nw,1);
     for k=1:2:Nw
        i=randsample(1:npop,2);
        p=pop(i);        
        [Ans1 Ans2]=WholeArethmeticCrossover(p,model);
        popw(k).Position=Ans1;
        popw(k+1).Position=Ans2;              
        popw(k).Cost=costfunction(popw(k).Position);
        popw(k+1).Cost=costfunction(popw(k+1).Position);
     end       
    pop=[pop
        popb 
        popa
        popw];
    costs=[pop.Cost];
    [costs locatsortedcost]=sort(costs);
    pop=pop(locatsortedcost);
    pop=pop(1:npop);
    BestCost(gen)=pop(1).Cost;       
end
disp(pop(1).Cost);
plot(BestCost);