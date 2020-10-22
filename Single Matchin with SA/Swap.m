function p=Swap(p)
n=numel(p);
i=randsample(n,2);
temp=p(i(1));
p(i(1))=p(i(2));
p(i(2))=temp;
end