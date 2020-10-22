function modle = Model()
p1 = [83 91 17 92 65 14 31 57 96 97];
p2  = [67 8 86 94 70 77 76 42 67 21];
Nmachin=size(p1,2);
xmax=150;
xmin=0;
ymax=150;
ymin=0;
v=[0 1 4 3 ;1 0 7 4;4 7 0 8;3 4 8 0];
NMjadid=size(v,1);
w=[5 3 1 7 6 7 10 12 8 7 ; 8 8 6 2 9 1 3 4 6 7 ; 9 8 12 9 11 1 10 2 4 11 ; 9 2 4 3 12 3 3 3 10 3];
modle.p1=p1;
modle.p2=p2;
modle.Nmachin=Nmachin;
modle.xmin=xmin;
modle.xmax=xmax;
modle.ymin=ymin;
modle.ymax=ymax;
modle.v=v;
modle.w=w;
modle.NMjadid=NMjadid;
end

