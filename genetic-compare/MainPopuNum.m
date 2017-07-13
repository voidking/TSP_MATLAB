clear %清理变量
clc %清屏
close all %关闭图像
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Timer=0.1;%定时器
CityNum=20;%城市的个数
LoopMax=100;%迭代次数
PopuNum=50;%预设种群规模 
CrossoverP=0.8;%交叉概率
MutationP=0.05;%变异概率
 
%CityList= RandomCityList(CityNum);
CityList=LoadCityList();

%PaintCityList(CityList);

[RouteBest,LengthBest]=Genetic(CityList,LoopMax,Timer,PopuNum,CrossoverP,MutationP);
subplot(2,2,1);
PaintResult(RouteBest,LengthBest,PopuNum,CrossoverP,MutationP);

PopuNum=200
[RouteBest,LengthBest]=Genetic(CityList,LoopMax,Timer,PopuNum,CrossoverP,MutationP);
subplot(2,2,2);
PaintResult(RouteBest,LengthBest,PopuNum,CrossoverP,MutationP);

PopuNum=400
[RouteBest,LengthBest]=Genetic(CityList,LoopMax,Timer,PopuNum,CrossoverP,MutationP);
subplot(2,2,3);
PaintResult(RouteBest,LengthBest,PopuNum,CrossoverP,MutationP);

PopuNum=800
[RouteBest,LengthBest]=Genetic(CityList,LoopMax,Timer,PopuNum,CrossoverP,MutationP);
subplot(2,2,4);
PaintResult(RouteBest,LengthBest,PopuNum,CrossoverP,MutationP);
