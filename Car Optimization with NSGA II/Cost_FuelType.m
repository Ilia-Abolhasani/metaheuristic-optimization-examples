function Ans=Cost_FuelType(Input)
Ans=0;
%% i = 6
if(Input(6)==1)
    Ans=Ans+0.75;
elseif(Input(6)==2)
    Ans=Ans+2;
else
    Ans=Ans+0.25;
end
end