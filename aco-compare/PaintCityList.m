function PaintCityList(CityList)

%»æ»­³ÇÊÐ
CityNum=size(CityList,1);
for i=1:CityNum-1
    PaintCircle(CityList(i,1),CityList(i,2));
    hold on;
end
PaintCircle(CityList(CityNum,1),CityList(CityNum,2));