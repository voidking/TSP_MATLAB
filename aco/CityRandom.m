function [distancelist,citylist]=CityRandom(N)
%����һ���������RM RandMetrix  
RM= rand(N,2).*200-100;%���ɵ�����ֵ��-100��+100֮��
for i=1:N
    for j=1:N
        DL(i,j)=Distance(RM(i,1),RM(i,2),RM(j,1),RM(j,2));
    end
end
distancelist=DL;
citylist=RM;
