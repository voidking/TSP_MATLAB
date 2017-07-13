function DistanceList=CountDistanceList(CityList)

N=length(CityList)
for i=1:N
    for j=1:N
        DL(i,j)=CountDistance(CityList(i,1),CityList(i,2),CityList(j,1),CityList(j,2));
    end
end
DistanceList=DL;

