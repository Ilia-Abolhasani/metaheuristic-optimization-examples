function Ans=Mutation(q)
%Mutation_BigSwap
n=size(q,2);
Point=randsample(1:n-1,2);
temp=q(Point(1));
q(Point(1))=q(Point(2));
q(Point(2))=temp;
Ans=q;
end