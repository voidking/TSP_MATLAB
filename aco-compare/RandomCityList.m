function CityList=RandomCityList(N)

%生成一个随机矩阵RM RandMetrix  
RM= rand(N,2).*200-100;%生成的坐标值在-100至+100之间
CityList=RM;
