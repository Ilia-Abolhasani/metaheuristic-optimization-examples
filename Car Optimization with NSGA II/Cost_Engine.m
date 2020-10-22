function Ans=Cost_Engine(Input)
Ans=0;
%% i = 9
if(Input(9)==1)
    Ans=Ans+2.5;
else
    Ans=Ans+1.5;
end
%% i = 10
if(Input(10)==1)
    Ans=Ans+1.5;
else
    Ans=Ans+0.5;
end
%% i = 11
if(Input(11)==1)
    Ans=Ans+0.75;
else
    Ans=Ans+0.25;
end
end