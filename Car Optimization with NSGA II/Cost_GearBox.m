function Ans=Cost_GearBox(Input)
Ans=0;
%% i = 7
if(Input(7)==1)
    Ans=Ans+2.5;
else
    Ans=Ans+0;
end
%% i = 8
if(Input(8)==1)
    Ans=Ans+0.5;
else
    Ans=Ans+1;
end
end