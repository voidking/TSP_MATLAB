%�������
AntNum=5; %���ϸ���
Alpha=1; %��Ϣ����Ҫ�̶ȵĲ���(��·��ѡ���кܴ�Ӱ��)
Beta=5; %����ʽ������Ҫ�̶ȵĲ���(��·��ѡ���кܴ�Ӱ��)
Rho=0.95; %��Ϣ�ػӷ�����

CityNum=20;
LoopMax=40; %����������
%CityList=RandomCityList(CityNum);
CityList=LoadCityList();

[LengthBest,LengthAverage,Shortest_Route,Shortest_Length]=Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho);
subplot(2,2,1);
PaintResult(LengthBest,LengthAverage,AntNum,Alpha,Beta,Rho);



AntNum=20
[LengthBest,LengthAverage,Shortest_Route,Shortest_Length]=Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho);

subplot(2,2,2);
PaintResult(LengthBest,LengthAverage,AntNum,Alpha,Beta,Rho);


AntNum=40
[LengthBest,LengthAverage,Shortest_Route,Shortest_Length]=Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho);;

subplot(2,2,3);
PaintResult(LengthBest,LengthAverage,AntNum,Alpha,Beta,Rho);

AntNum=100
[LengthBest,LengthAverage,Shortest_Route,Shortest_Length]=Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho);

subplot(2,2,4);
PaintResult(LengthBest,LengthAverage,AntNum,Alpha,Beta,Rho);


