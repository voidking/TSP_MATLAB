function PaintRoute(CityList,Route)

PaintCityList(CityList);
CityNum=length(CityList);
%绘画路径线段
Px=[0,0];%存放第1个，第2个点的x轴坐标
Py=[0,0];%存放第1个，第2个点的y轴坐标
for i=1:CityNum-1
    Px(1)=CityList(Route(i),1);
    Py(1)=CityList(Route(i),2);

    Px(2)=CityList(Route(i+1),1);
    Py(2)=CityList(Route(i+1),2);

    plot(Px,Py,'-r'); %画两个点之间的线段
    hold on; %保持画面
end 
Px(1)=CityList(Route(CityNum),1);
Py(1)=CityList(Route(CityNum),2);

Px(2)=CityList(Route(1),1);
Py(2)=CityList(Route(1),2);
plot(Px,Py,'-r'); %画两个点之间的线段
hold on; %保持画面