function Paint(CityList,RouteBest,LengthBest,Loop,IsEnd)

%绘画城市
CityNum=size(CityList,1);
for i=1:CityNum-1
    Circle(CityList(i,1),CityList(i,2));
    hold on;
end
Circle(CityList(CityNum,1),CityList(CityNum,2));

%绘画路径线段
Px=[0,0];%存放第1个，第2个点的x轴坐标
Py=[0,0];%存放第1个，第2个点的y轴坐标
for i=1:CityNum-1
    Px(1)=CityList(RouteBest(i),1);
    Py(1)=CityList(RouteBest(i),2);

    Px(2)=CityList(RouteBest(i+1),1);
    Py(2)=CityList(RouteBest(i+1),2);

    plot(Px,Py,'-r'); %画两个点之间的线段
    hold on; %保持画面
end 
Px(1)=CityList(RouteBest(CityNum),1);
Py(1)=CityList(RouteBest(CityNum),2);

Px(2)=CityList(RouteBest(1),1);
Py(2)=CityList(RouteBest(1),2);
plot(Px,Py,'-r'); %画两个点之间的线段
hold on; %保持画面

if IsEnd==0
    disp=['第 ',int2str(Loop),' 次迭代','  最短距离为 ',num2str(LengthBest)];
else
    disp=['最终搜索结果：最短距离 ',num2str(LengthBest)];
end
title(disp,'fontsize',15,'Color','b');

hold off; %换一个换面
pause(0.05);