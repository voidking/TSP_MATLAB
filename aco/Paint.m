function Paint(CityList,RouteBest,LengthBest,Loop,IsEnd)

%�滭����
CityNum=size(CityList,1);
for i=1:CityNum-1
    Circle(CityList(i,1),CityList(i,2));
    hold on;
end
Circle(CityList(CityNum,1),CityList(CityNum,2));

%�滭·���߶�
Px=[0,0];%��ŵ�1������2�����x������
Py=[0,0];%��ŵ�1������2�����y������
for i=1:CityNum-1
    Px(1)=CityList(RouteBest(i),1);
    Py(1)=CityList(RouteBest(i),2);

    Px(2)=CityList(RouteBest(i+1),1);
    Py(2)=CityList(RouteBest(i+1),2);

    plot(Px,Py,'-r'); %��������֮����߶�
    hold on; %���ֻ���
end 
Px(1)=CityList(RouteBest(CityNum),1);
Py(1)=CityList(RouteBest(CityNum),2);

Px(2)=CityList(RouteBest(1),1);
Py(2)=CityList(RouteBest(1),2);
plot(Px,Py,'-r'); %��������֮����߶�
hold on; %���ֻ���

if IsEnd==0
    disp=['�� ',int2str(Loop),' �ε���','  ��̾���Ϊ ',num2str(LengthBest)];
else
    disp=['���������������̾��� ',num2str(LengthBest)];
end
title(disp,'fontsize',15,'Color','b');

hold off; %��һ������
pause(0.05);