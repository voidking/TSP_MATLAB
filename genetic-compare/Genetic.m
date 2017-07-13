function [RouteBest,LengthBest]=Genetic(CityList,LoopMax,Timer,PopuNum,CrossoverP,MutationP)

CityNum=length(CityList);%城市个数
DistanceList=CountDistanceList(CityList);

RouteBest=zeros(LoopMax,CityNum); %各代最佳路线
LengthBest=inf.*ones(LoopMax,1);%各代最佳路线的长度

%初始化种群Farm，采用随机生成方法
Temp2=zeros(PopuNum,1);%1列用于存放距离
Temp1=zeros(PopuNum,CityNum);%N列用于存放路径

for index=1:PopuNum %循环M次
    Temp1(index,:)=randperm(CityNum);%生成一个1到N随机序列
end
% 种群规模M为行数  城市的个数N+1为列数 ,最后一列放适应度
Farm=[Temp1,Temp2];%矩阵的合并

Loop=1;
while Loop<=LoopMax    %循环体开始

    %评价种群，计算每个个体的适应度
    Farm=AdaptFun(Farm,DistanceList);%调用适应度函数AdaptFun，生成适应度

    %界面输出  包括初始化后、每次迭代后
    result=min(Farm(:,CityNum+1));%在所有行的第N+1列中寻找最小值
    [r,c]=find(Farm(:,CityNum+1)==result);%寻找存放最小值的对应行号
    FarmTemp=Farm;
    FarmTemp(:,21)=[];
    RouteBest(Loop,:)=FarmTemp(r(1),:);
    LengthBest(Loop)=Farm(r(1),21);
    %绘画路径
    %r可能出现多行情况（有多个解），故r(1)
    %Paint(LoopMax,Loop,Timer,Farm,r(1),CityList);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %选择
    Farm=Selection(Farm,PopuNum);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %交叉
    Farm=Crossover(Farm,CrossoverP);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %变异
    Farm=Mutation(Farm,MutationP);
    
    Loop=Loop+1; %迭代计数器
end    %循环体1  结束标识符

