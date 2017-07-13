%CityList ���������б�
%LoopMax ����������

%AntNum ���ϸ���
%Alpha ��Ϣ����Ҫ�̶ȵĲ���
%Beta ����ʽ������Ҫ�̶ȵĲ���
%Rho ��Ϣ�ػӷ�����

%LengthBest ÿ�ε������·������
%LengthAverage ÿ�ε���ƽ��·������
%Shortest_Route ���·��
%Shortest_Length ���·������
function [LengthBest,LengthAverage,Shortest_Route,Shortest_Length] = Aco(CityList,LoopMax,AntNum,Alpha,Beta,Rho)

CityNum=length(CityList);%���и���
DistanceList=CountDistanceList(CityList);
Info=ones(CityNum,CityNum);%��Ϣ�ؾ���
Reciprocal=1./DistanceList;
Travelled=zeros(AntNum,CityNum);%�ѷ��ʳ���
Loop=1;%����������
RouteBest=zeros(LoopMax,CityNum); %�������·��
LengthBest=inf.*ones(LoopMax,1);%�������·�ߵĳ���
LengthAverage=zeros(LoopMax,1);%����·�ߵ�ƽ������
Q=100;%Q ��Ϣ������ǿ��ϵ��

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
    %Paint(CityList,RouteBest(Loop,:),LengthBest(Loop),Loop,0);
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
    Infoji(Loop)=Info(1,2);
end


%������
Pos=find(LengthBest==min(LengthBest));
Shortest_Route=RouteBest(Pos(1),:);
Shortest_Length=LengthBest(Pos(1));

