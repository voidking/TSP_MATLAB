function PaintRoute(CityList,Route)

PaintCityList(CityList);
CityNum=length(CityList);
%�滭·���߶�
Px=[0,0];%��ŵ�1������2�����x������
Py=[0,0];%��ŵ�1������2�����y������
for i=1:CityNum-1
    Px(1)=CityList(Route(i),1);
    Py(1)=CityList(Route(i),2);

    Px(2)=CityList(Route(i+1),1);
    Py(2)=CityList(Route(i+1),2);

    plot(Px,Py,'-r'); %��������֮����߶�
    hold on; %���ֻ���
end 
Px(1)=CityList(Route(CityNum),1);
Py(1)=CityList(Route(CityNum),2);

Px(2)=CityList(Route(1),1);
Py(2)=CityList(Route(1),2);
plot(Px,Py,'-r'); %��������֮����߶�
hold on; %���ֻ���