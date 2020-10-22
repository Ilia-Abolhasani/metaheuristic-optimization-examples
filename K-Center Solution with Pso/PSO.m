clear all
%% problem definition
model=Model();
costfunction=@(q)Cost(q,model);
nvar=2*model.NMjadid;
%% PSO Parameters
maxgen=400;
nparticle=40;
d=0.97;
c0=1;
c1=2;
c2=2.5;
%% Initialization
Particle.Position=[];
Particle.Cost=[];
Particle.Velocity=[];
Particle.Pbest.Position=[];
Particle.Pbest.Cost=[];
Particles=repmat(Particle,nparticle,1);
% Initialization Population
for i=1:nparticle
    Particles(i).Position=RandomSolution(model);
    Particles(i).Cost=costfunction(Particles(i).Position);
    Particles(i).Velocity=0;    
    Particles(i).Pbest.Position=Particles(i).Position;
    Particles(i).Pbest.Cost=Particles(i).Cost;
end
ParticleCost=[Particles.Cost];
[MinParticleCost MinParticleLocation]=min(ParticleCost);
gBest=Particles(MinParticleLocation).Pbest;
BestCost=zeros(maxgen,1);
%% Main loop of PSO algorithm
for gen=1:maxgen
    for i=1:nparticle
        % Calculation new Velocity
        Particles(i).Velocity=c0*Particles(i).Velocity...
            +c1*rand()*(Particles(i).Pbest.Position-...
            Particles(i).Position)+c2*rand()*...
            (gBest.Position-Particles(i).Position);        
        % Calculation new Position
        Particles(i).Position=Particles(i).Position+Particles(i).Velocity;
        % Correction new answers 
        u=1:2:nvar;
        r=2:2:nvar;
        Particles(i).Position(u)=max(Particles(i).Position(u),model.xmin);
        Particles(i).Position(u)=min(Particles(i).Position(u),model.xmax);
        Particles(i).Position(r)=max(Particles(i).Position(r),model.ymin);
        Particles(i).Position(r)=min(Particles(i).Position(r),model.ymax);
        Particles(i).Cost=costfunction(Particles(i).Position);
        % Comparison new Particles with gBest and Best answer
        if (Particles(i).Cost<Particles(i).Pbest.Cost)
            Particles(i).Pbest.Position=Particles(i).Position;
            Particles(i).Pbest.Cost=Particles(i).Cost;
            if (Particles(i).Pbest.Cost<gBest.Cost)
                gBest=Particles(i).Pbest;                
            end
        end        
    end
    c0=d*c0;
    BestCost(gen)=gBest.Cost;
end
plot(BestCost);
min(BestCost)
