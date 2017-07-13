function PaintResult(LengthBest, LengthAverage,AntNum,Alpha,Beta,Rho)
%plot([LengthBest LengthAverage]);
%legend('最短距离','平均距离');

plot([LengthBest]);
legend('最短距离');

[MinValue Index]=min(LengthBest);
Label=['(',int2str(Index),',',int2str(MinValue),')'];
text(Index,MinValue,Label);
%content=['蚂蚁个数为',int2str(AntNum)];
%content=['信息启发式因子为',num2str(Alpha)];
%content=['期望值启发式因子为',num2str(Beta)];
content=['信息素挥发因子为',num2str(Rho)];
title(content,'fontsize',10,'Color','b');