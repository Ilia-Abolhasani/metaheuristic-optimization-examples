function z=cost(q,model)
n=model.numofemptyplace;
w=model.weight;
d=model.d;
z=zeros(n,n);
for i=1:n-1
    for j=i+1 :n
        z(i,j)=w(i,j)*d(q(i),q(j));
        z(j,i)=z(i,j);
    end
end
z=sum(sum(z))/2;
end