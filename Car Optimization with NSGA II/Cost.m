function Ans=Cost(Input)
%Input=Chromosome
%Ans equal array of costs
%Continuous transformation to discrete
Input=Convertor(Input);
%% calculte Anses
Ans=[Cost_Safety(Input)
    Cost_Speed(Input)
    Cost_FuelType(Input)
    Cost_GearBox(Input)
    Cost_Engine(Input)
    Cost_Option(Input)
    Cost_FuelConsumption(Input)
    Cost_Price(Input)];
%% return Ans
end