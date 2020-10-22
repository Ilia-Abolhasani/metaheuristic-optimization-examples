function qnew=RandomSolution(model)

xmax=model.xmax;
ymax=model.ymax;
n=model.NMjadid;
qnew=zeros(1,2*n);
for i=1:2:2*n
    qnew(i)=rand()*xmax;
end
for i=2:2:2*n
    qnew(i)=rand()*ymax;
end
end