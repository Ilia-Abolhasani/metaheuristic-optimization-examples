function Ans=Cost_FuelConsumption(Input)
Ans=0;
%% i = 18
if(Input(18)==1)
    Ans=Ans+2;
elseif(Input(18)==2)
    Ans=Ans+1.5;
else
    Ans=Ans+0.5;
end
%% i = 19
if(Input(19)==1)
    Ans=Ans+0.75;
elseif(Input(19)==2)
    Ans=Ans+0.5;
else
    Ans=Ans+0.25;
end
%% i = 20
if(Input(20)==1)
    Ans=Ans+1.5;
elseif(Input(20)==2)
    Ans=Ans+0.75;
else
    Ans=Ans+0.25;
end
end