function Ans=Convertor(Input)
for i=1 : numel(Input)
    if(i==5||i==6||i>17) %three state
        if(Input(i)<0.33)
            Input(i)=1;
        elseif(Input(i)<0.66)
            Input(i)=2;
        else
            Input(i)=3;
        end
    elseif(i==1||i==4)%four state
        if(Input(i)<0.25)
            Input(i)=1;
        elseif(Input(i)<0.5 )
            Input(i)=2;
        elseif(Input(i)<0.75)
            Input(i)=3;
        else
            Input(i)=4;
        end
    else%two state
        if(Input(i)<0.5)        
            Input(i)=0;
        else
            Input(i)=1;
        end        
    end
end
Ans=Input;
end