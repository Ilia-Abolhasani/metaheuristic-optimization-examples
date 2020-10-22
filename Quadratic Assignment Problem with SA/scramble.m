function p=scramble(p)
n=numel(p);
i=sort(randsample(n,2));
x=i(2)-i(1)+1;
a=randsample(i(1):i(2),x);
b=sort(a);
p(b)=p(a);
p;
end