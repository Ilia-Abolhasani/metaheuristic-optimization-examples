function model=SingelMachin()
%ProcessingTime=[12 30 10 26 27 28 11 18 15 26];
%DueDate=[15 35 40 60 90 120 55 150 130 210];
ProcessingTime=[12 30 10 26 27 28 11 18 15 26 15 18 20 43 17 20 35 19 25 14];
DueDate=[15 35 40 60 90 120 55 150 130 210 230 240 246 260 289 300 324 345 367  384];
J=size(ProcessingTime,1);%number of machin here=1 Machin
I=size(ProcessingTime,2);%number of job for any machin here=10 for Machin 1
model.I=I;
model.J=J;
model.P=ProcessingTime;
model.D=DueDate;
end