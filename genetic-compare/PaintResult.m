function PaintResult(RouteBest,LengthBest, PopuNum,CrossoverP,MutationP)
%plot([LengthBest LengthAverage]);
%legend('最短距离','平均距离');

plot([LengthBest]);
legend('最短距离');

[MinValue Index]=min(LengthBest);
Label=['(',int2str(Index),',',int2str(MinValue),')'];
text(Index,MinValue,Label);
%content=['个体数量为',num2str(PopuNum)];
%content=['交叉概率为',num2str(CrossoverP)];
content=['变异概率为',num2str(MutationP)];
title(content,'fontsize',10,'Color','b');