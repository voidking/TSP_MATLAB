%程序入口
AntNum=20; %蚂蚁个数
Alpha=0.5; %信息素重要程度的参数(对路径选择有很大影响)
Beta=5; %启发式因子重要程度的参数(对路径选择有很大影响)
Rho=0.95; %信息素挥发因子

CityNum=20;
LoopMax=40; %最大迭代次数
%CityList=RandomCityList(CityNum);
CityList=LoadCityList();

[LengthBest,LengthAverage,Shortest_Route,Shortest_Length]=Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho);
subplot(2,2,1);
PaintResult(LengthBest,LengthAverage,AntNum,Alpha,Beta,Rho);


Alpha=1
[LengthBest,LengthAverage,Shortest_Route,Shortest_Length]=Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho);

subplot(2,2,2);
PaintResult(LengthBest,LengthAverage,AntNum,Alpha,Beta,Rho);


Alpha=2
[LengthBest,LengthAverage,Shortest_Route,Shortest_Length]=Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho);;

subplot(2,2,3);
PaintResult(LengthBest,LengthAverage,AntNum,Alpha,Beta,Rho);

Alpha=5
[LengthBest,LengthAverage,Shortest_Route,Shortest_Length]=Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho);

subplot(2,2,4);
PaintResult(LengthBest,LengthAverage,AntNum,Alpha,Beta,Rho);


