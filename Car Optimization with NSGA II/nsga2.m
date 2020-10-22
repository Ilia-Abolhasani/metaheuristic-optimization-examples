clc;
clear all;
close all;
%% NSGA-II Parameters
MaxIt=10;
nPop=50;
pCrossover=0.8;
pMutation=0.3;
%%

nCrossover=round(pCrossover*nPop/2)*2;
nMutation=round(pMutation*nPop);

%% Initialization
%struct defenition
empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Rank=[];
empty_individual.CrowdingDistance=[];
empty_individual.DominatedCount=[];
empty_individual.DominationSet=[];
% parimery population
pop=repmat(empty_individual,nPop,1);
for i=1:nPop
   % pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
    pop(i).Position=CreateChromosome();
    pop(i).Cost=Cost(pop(i).Position);
end
% Non-dominated Sorting
[pop, F]=NonDominatedSorting(pop);
% Calculate Crowding Distances
pop=CalcCrowdingDistance(pop,F);
priceData=zeros(1,MaxIt);
SafteData=zeros(1,MaxIt);
speedData=zeros(1,MaxIt);
%% NSGA-II Loop
for it=1:MaxIt  
    % Crossover
    popc=repmat(empty_individual,nCrossover/2,2);
    for k=1:nCrossover/2
        i1=randi(nPop,1,1);
        i2=randi(nPop,1,1);
        p=[pop(i1),pop(i2)];
        [popc(k,1).Position, popc(k,2).Position]=Crossover(p);                      
        popc(k,1).Cost=Cost(popc(k,1).Position);
        popc(k,2).Cost=Cost(popc(k,2).Position);
    end
    popc=popc(:);    
    % Mutation
    popm=repmat(empty_individual,nMutation,1);
    for k=1:nMutation                      
        popm(k).Position=Mutation(pop(i).Position);                
        popm(k).Cost=Cost(popm(k).Position);
    end
    % Merge Pops
    pop=[pop
         popc
         popm];    
    % Non-dominated Sorting
    [pop, F]=NonDominatedSorting(pop);    
    % Calculate Crowding Distances
    pop=CalcCrowdingDistance(pop,F);    
    % Sort Population
    pop=SortPopulation(pop);    
    % Delete Extra Individuals
    pop=pop(1:nPop);    
    % Non-dominated Sorting
    [pop, F]=NonDominatedSorting(pop);    
    Safty(it)=pop(1).Cost(1);
    Speed(it)=pop(1).Cost(2);
    Price(it)=pop(1).Cost(8);
    % Calculate Crowding Distances
    pop=CalcCrowdingDistance(pop,F);    
    % Plot F1
%     PF=pop(F{1});
%     PFCosts=[PF.Cost];
%     figure(1);
%     plot(PFCosts(1,:),PFCosts(2,:),'*');
%     xlabel('f_1');
%     ylabel('f_2');
%     
    % Show Iteration Information
%     disp(['Iteraion ' num2str(it) ': Number of F1 Members = ' num2str(numel(PF))]);

end
%% Show Results
Convertor(pop(1).Position)
pop(1).Cost