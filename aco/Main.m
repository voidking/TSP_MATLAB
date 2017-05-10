%程序入口
%初始化变量
clear;
CityNum=20; %问题的规模（城市个数）
AntNum=20; %蚂蚁个数
Alpha=1; %信息素重要程度的参数(对路径选择有很大影响)
Beta=5; %启发式因子重要程度的参数(对路径选择有很大影响)
Rho=0.95; %信息素挥发因子
LoopMax=40; %最大迭代次数
Loop=1;%迭代计数器
Q=100; %信息素增加强度系数 (对结果影响小)
[DistanceList,CityList]=CityRandom(CityNum);
Reciprocal=1./DistanceList;
Info=ones(CityNum,CityNum);%信息素矩阵
Travelled=zeros(AntNum,CityNum);%已访问城市

RouteBest=zeros(LoopMax,CityNum); %各代最佳路线
LengthBest=inf.*ones(LoopMax,1);%各代最佳路线的长度
LengthAverage=zeros(LoopMax,1);%各代路线的平均长度
figure(1);
while Loop<=LoopMax %停止条件：达到最大迭代次数
    %将m只蚂蚁随机放到CityNum个城市上
    Randpos=[];
    for i=1:(ceil(AntNum/CityNum))
        Randpos=[Randpos,randperm(CityNum)];
    end
    Travelled(:,1)=(Randpos(1,1:AntNum))';
    %将m只蚂蚁都放到第一个城市上
    %Travelled(:,1)=ones(AntNum,1);
    
    %m只蚂蚁按概率函数选择下一座城市，完成各自的周游
    for j=2:CityNum
        for i=1:AntNum
            Visited=Travelled(i,1:(j-1)); %已访问的城市
            Allowed=zeros(1,(CityNum-j+1));%待访问的城市
            Probability=Allowed;%待访问城市的选择概率分布
            AllowedIndex=1;
            for k=1:CityNum
                if isempty(find(Visited==k, 1))
                    Allowed(AllowedIndex)=k;
                    AllowedIndex=AllowedIndex+1;
                end
            end
            %计算待选城市的概率分布
            for k=1:length(Allowed)
                Probability(k)=(Info(Visited(end),Allowed(k))^Alpha)*(Reciprocal(Visited(end),Allowed(k))^Beta);
            end
            Probability=Probability/(sum(Probability));
            %按概率选择下一个城市
            Pcum=cumsum(Probability);
            Select=find(Pcum>=rand);
            ToVisit=Allowed(Select(1));
            Travelled(i,j)=ToVisit;
        end
    end
    if Loop>=2
        Travelled(1,:)=RouteBest(Loop-1,:);
    end
    %记录本次迭代最佳路线
    L=zeros(AntNum,1);
    for i=1:AntNum
        R=Travelled(i,:);
        L(i)=SelectBest(DistanceList,R);
    end
    LengthBest(Loop)=min(L);
    pos=find(L==LengthBest(Loop));
    RouteBest(Loop,:)=Travelled(pos(1),:);
    LengthAverage(Loop)=mean(L);
    Paint(CityList,RouteBest(Loop,:),LengthBest(Loop),Loop,0);
    Loop=Loop+1;
    %更新信息素
    Delta_Info=zeros(CityNum,CityNum);
    for i=1:AntNum
        for j=1:(CityNum-1)
            Delta_Info(Travelled(i,j),Travelled(i,j+1))=Delta_Info(Travelled(i,j),Travelled(i,j+1))+Q/L(i);
        end
        Delta_Info(Travelled(i,CityNum),Travelled(i,1))=Delta_Info(Travelled(i,CityNum),Travelled(i,1))+Q/L(i);
    end
    Info=(1-Rho).*Info+Delta_Info;
     %禁忌表清零
    Travelled=zeros(AntNum,CityNum);
    %pause;
    Infoji(Loop)=Info(1,2);
end
Paint(CityList,RouteBest(LoopMax,:),LengthBest(LoopMax),LoopMax,1);

%输出结果
Pos=find(LengthBest==min(LengthBest));
Shortest_Route=RouteBest(Pos(1),:);
Shortest_Length=LengthBest(Pos(1));
figure(2);
plot([LengthBest LengthAverage]);
legend('最短距离','平均距离');
