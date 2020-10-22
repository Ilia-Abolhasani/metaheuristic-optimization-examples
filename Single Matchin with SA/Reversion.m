function p=Reversion(p)
n=numel(p);
i=sort(randsample(n,2));
p(i(1):i(2))= p(i(2):-1:i(1));
end