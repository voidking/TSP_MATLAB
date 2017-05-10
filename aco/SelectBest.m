function F=SelectBest(DistanceList,s)
DistanV=0;
n=size(s,2);
for i=1:(n-1)
    DistanV=DistanV+DistanceList(s(i),s(i+1));
end
DistanV=DistanV+DistanceList(s(n),s(1));
F=DistanV;