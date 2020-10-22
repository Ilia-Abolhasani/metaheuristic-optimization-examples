function model=QAP()
x=[13 7 6 29 28 7 43 31 17 26 9];
y=[9 12 21 46 48 25 24 17 45 18 22];
numofemptyplace=size(x,2);
weight=[0,15,9,9,10,13,7,14,7,8
    15,0,14,10,14,8,12,9,9,12
    9,14,0,10,13,14,9,11,14,7
    9,10,10,0,14,6,9,15,12,8
    10,14,13,14,0,10,10,7,14,15
    13,8,14,6,10,0,12,10,10,13
    7,12,9,9,10,12,0,10,9,7
    14,9,11,15,7,10,10,0,7,13
    7,9,14,12,14,10,9,7,0,15
    8,12,7,8,15,13,7,13,15,0];
numofmachin=size(weight,1);
if(numofmachin < numofemptyplace)
    for i=numofmachin+1:numofemptyplace
        for j=numofmachin+1:numofemptyplace
            weight(i,j)=0;
        end
    end    
end
d=zeros(numofemptyplace,numofemptyplace);
for i=1:numofemptyplace-1
    for j=i+1:numofemptyplace
        d(i,j)=sqrt(((x(i)-x(j))^2)+(((y(i)-y(j))^2)));
        d(j,i)=d(i,j);
    end
end
model.x=x;
model.y=y;
model.d=d;
model.numofemptyplace=numofemptyplace;
model.numofmachin=numofmachin;
model.weight=weight;
end
