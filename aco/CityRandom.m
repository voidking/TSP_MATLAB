function [distancelist,citylist]=CityRandom(N)
%生成一个随机矩阵RM RandMetrix  
RM= rand(N,2).*200-100;%生成的坐标值在-100至+100之间
for i=1:N
    for j=1:N
        DL(i,j)=Distance(RM(i,1),RM(i,2),RM(j,1),RM(j,2));
    end
end
distancelist=DL;
citylist=RM;
