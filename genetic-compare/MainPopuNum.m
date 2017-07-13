clear %��������
clc %����
close all %�ر�ͼ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Timer=0.1;%��ʱ��
CityNum=20;%���еĸ���
LoopMax=100;%��������
PopuNum=50;%Ԥ����Ⱥ��ģ 
CrossoverP=0.8;%�������
MutationP=0.05;%�������
 
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