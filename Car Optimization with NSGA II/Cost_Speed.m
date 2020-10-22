function Ans=Cost_Speed(Input)
Ans=0;
%% i = 4
if(Input(4)==1)
    Ans=Ans+2;
elseif(Input(4)==2)
    Ans=Ans+1;
elseif(Input(4)==3)
    Ans=Ans+0.75;
else
    Ans=Ans+0.25;
end
%% i = 5
if(Input(5)==1)
    Ans=Ans+2;
elseif(Input(5)==3)
    Ans=Ans+1.5;
else
    Ans=Ans+0.5;
end
end