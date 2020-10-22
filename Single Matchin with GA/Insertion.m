function p=Insertion(p)
n=numel(p);
i=sort(randsample(n,2));
temp=p(i(1));
for k=i(1):i(2)
    if(k~=n)
    p(k)=p(k+1);    
    end
end
p(i(2))=temp;
end