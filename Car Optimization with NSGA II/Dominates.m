function flag=Dominates(input1,input2)
Cost1=Cost(input1.Position);
Cost2=Cost(input2.Position);
if( Cost1(1)>Cost2(1)&&...
    Cost1(2)>Cost2(2)&&...
    Cost1(7)<Cost2(7)&&...
    Cost1(8)<Cost2(8)...
    )
%     Cost1(3)<Cost2(3)&&...
%     Cost1(4)<Cost2(4)&&...
%     Cost1(5)<Cost2(5)&&...
%     Cost1(6)<Cost2(6)&&...
    flag=1;
else
    flag = 0;
end
end