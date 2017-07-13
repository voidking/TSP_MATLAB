function  Paint(LoopMax,Loop,timer,Farm,row,CityList)

%计算Farm现在的行数R ，列数C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);

hold off; %换一个画面
%画初始的节点N个
for i=1:C-1
        PaintCircle(CityList(i,1),CityList(i,2));
        hold on;%让下次画图保持上一个画面          
end

%绘画路径线段
Px=[0,0];%存放第1个，第2个点的x轴坐标
Py=[0,0];%存放第1个，第2个点的y轴坐标
for i=1:C-1-1
    Px(1)=CityList(Farm(row,i),1);
    Px(2)=CityList(Farm(row,i+1),1);
    Py(1)=CityList(Farm(row,i),2);
    Py(2)=CityList(Farm(row,i+1),2);
    plot(Px,Py,'-r'); %画两个点之间的线段
    hold on; %保持画面
end 
    Px(1)=CityList(Farm(row,C-1),1);
    Px(2)=CityList(Farm(row,1),1);
    Py(1)=CityList(Farm(row,C-1),2);
    Py(2)=CityList(Farm(row,1),2);
    plot(Px,Py,'-r'); %画两个点之间的线段
    hold on; %保持画面
    
%标题设置
 if LoopMax==Loop
   disp=[num2str(LoopMax) '次迭代' '最优解为' num2str(round(Farm(row,C)))];
   title(disp,'fontsize',15,'Color','b');
 else
   disp=['第' num2str(Loop) '/' num2str(LoopMax) '次迭代最优解为' num2str(round(Farm(row,C)))];
   title(disp,'fontsize',15,'Color','b');  
 end
 pause(timer);%计时器，停顿时间

