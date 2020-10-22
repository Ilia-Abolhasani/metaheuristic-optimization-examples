function Ans=Cost_Safety(Input)
Ans=0;
%% i = 1
if(Input(1)==1)
    Ans=Ans+2;
elseif(Input(1)==2)
    Ans=Ans+1;
elseif(Input(1)==3)
    Ans=Ans+0.75;
else
    Ans=Ans+0.25;
end
%% i = 2
if(Input(2)==1)
    Ans=Ans+2;
else
    Ans=Ans+1;
end
%% i = 3
if(Input(3)==1)
    Ans=Ans+2;
end
end