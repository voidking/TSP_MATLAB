%�������
%��ʼ������
clear;
CityNum=20; %����Ĺ�ģ�����и�����
AntNum=20; %���ϸ���
Alpha=1; %��Ϣ����Ҫ�̶ȵĲ���(��·��ѡ���кܴ�Ӱ��)
Beta=5; %����ʽ������Ҫ�̶ȵĲ���(��·��ѡ���кܴ�Ӱ��)
Rho=0.95; %��Ϣ�ػӷ�����
LoopMax=40; %����������
Loop=1;%����������
Q=100; %��Ϣ������ǿ��ϵ�� (�Խ��Ӱ��С)
[DistanceList,CityList]=CityRandom(CityNum);
Reciprocal=1./DistanceList;
Info=ones(CityNum,CityNum);%��Ϣ�ؾ���
Travelled=zeros(AntNum,CityNum);%�ѷ��ʳ���

RouteBest=zeros(LoopMax,CityNum); %�������·��
LengthBest=inf.*ones(LoopMax,1);%�������·�ߵĳ���
LengthAverage=zeros(LoopMax,1);%����·�ߵ�ƽ������
figure(1);
while Loop<=LoopMax %ֹͣ�������ﵽ����������
    %��mֻ��������ŵ�CityNum��������
    Randpos=[];
    for i=1:(ceil(AntNum/CityNum))
        Randpos=[Randpos,randperm(CityNum)];
    end
    Travelled(:,1)=(Randpos(1,1:AntNum))';
    %��mֻ���϶��ŵ���һ��������
    %Travelled(:,1)=ones(AntNum,1);
    
    %mֻ���ϰ����ʺ���ѡ����һ�����У���ɸ��Ե�����
    for j=2:CityNum
        for i=1:AntNum
            Visited=Travelled(i,1:(j-1)); %�ѷ��ʵĳ���
            Allowed=zeros(1,(CityNum-j+1));%�����ʵĳ���
            Probability=Allowed;%�����ʳ��е�ѡ����ʷֲ�
            AllowedIndex=1;
            for k=1:CityNum
                if isempty(find(Visited==k, 1))
                    Allowed(AllowedIndex)=k;
                    AllowedIndex=AllowedIndex+1;
                end
            end
            %�����ѡ���еĸ��ʷֲ�
            for k=1:length(Allowed)
                Probability(k)=(Info(Visited(end),Allowed(k))^Alpha)*(Reciprocal(Visited(end),Allowed(k))^Beta);
            end
            Probability=Probability/(sum(Probability));
            %������ѡ����һ������
            Pcum=cumsum(Probability);
            Select=find(Pcum>=rand);
            ToVisit=Allowed(Select(1));
            Travelled(i,j)=ToVisit;
        end
    end
    if Loop>=2
        Travelled(1,:)=RouteBest(Loop-1,:);
    end
    %��¼���ε������·��
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
    %������Ϣ��
    Delta_Info=zeros(CityNum,CityNum);
    for i=1:AntNum
        for j=1:(CityNum-1)
            Delta_Info(Travelled(i,j),Travelled(i,j+1))=Delta_Info(Travelled(i,j),Travelled(i,j+1))+Q/L(i);
        end
        Delta_Info(Travelled(i,CityNum),Travelled(i,1))=Delta_Info(Travelled(i,CityNum),Travelled(i,1))+Q/L(i);
    end
    Info=(1-Rho).*Info+Delta_Info;
     %���ɱ�����
    Travelled=zeros(AntNum,CityNum);
    %pause;
    Infoji(Loop)=Info(1,2);
end
Paint(CityList,RouteBest(LoopMax,:),LengthBest(LoopMax),LoopMax,1);

%������
Pos=find(LengthBest==min(LengthBest));
Shortest_Route=RouteBest(Pos(1),:);
Shortest_Length=LengthBest(Pos(1));
figure(2);
plot([LengthBest LengthAverage]);
legend('��̾���','ƽ������');
