function qnew =SolNeighbor(q)
m=randi(4);
switch m
    case 1 
        qnew=Swap(q);
    case 2 
        qnew=Reversion(q);
    case 3
        qnew=Insertion(q);
    case 4
        qnew=scramble(q);
end
end
