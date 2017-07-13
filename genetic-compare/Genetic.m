function [RouteBest,LengthBest]=Genetic(CityList,LoopMax,Timer,PopuNum,CrossoverP,MutationP)

CityNum=length(CityList);%���и���
DistanceList=CountDistanceList(CityList);

RouteBest=zeros(LoopMax,CityNum); %�������·��
LengthBest=inf.*ones(LoopMax,1);%�������·�ߵĳ���

%��ʼ����ȺFarm������������ɷ���
Temp2=zeros(PopuNum,1);%1�����ڴ�ž���
Temp1=zeros(PopuNum,CityNum);%N�����ڴ��·��

for index=1:PopuNum %ѭ��M��
    Temp1(index,:)=randperm(CityNum);%����һ��1��N�������
end
% ��Ⱥ��ģMΪ����  ���еĸ���N+1Ϊ���� ,���һ�з���Ӧ��
Farm=[Temp1,Temp2];%����ĺϲ�

Loop=1;
while Loop<=LoopMax    %ѭ���忪ʼ

    %������Ⱥ������ÿ���������Ӧ��
    Farm=AdaptFun(Farm,DistanceList);%������Ӧ�Ⱥ���AdaptFun��������Ӧ��

    %�������  ������ʼ����ÿ�ε�����
    result=min(Farm(:,CityNum+1));%�������еĵ�N+1����Ѱ����Сֵ
    [r,c]=find(Farm(:,CityNum+1)==result);%Ѱ�Ҵ����Сֵ�Ķ�Ӧ�к�
    FarmTemp=Farm;
    FarmTemp(:,21)=[];
    RouteBest(Loop,:)=FarmTemp(r(1),:);
    LengthBest(Loop)=Farm(r(1),21);
    %�滭·��
    %r���ܳ��ֶ���������ж���⣩����r(1)
    %Paint(LoopMax,Loop,Timer,Farm,r(1),CityList);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %ѡ��
    Farm=Selection(Farm,PopuNum);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %����
    Farm=Crossover(Farm,CrossoverP);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %����
    Farm=Mutation(Farm,MutationP);
    
    Loop=Loop+1; %����������
end    %ѭ����1  ������ʶ��

