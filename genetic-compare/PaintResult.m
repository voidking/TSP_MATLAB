function PaintResult(RouteBest,LengthBest, PopuNum,CrossoverP,MutationP)
%plot([LengthBest LengthAverage]);
%legend('��̾���','ƽ������');

plot([LengthBest]);
legend('��̾���');

[MinValue Index]=min(LengthBest);
Label=['(',int2str(Index),',',int2str(MinValue),')'];
text(Index,MinValue,Label);
%content=['��������Ϊ',num2str(PopuNum)];
%content=['�������Ϊ',num2str(CrossoverP)];
content=['�������Ϊ',num2str(MutationP)];
title(content,'fontsize',10,'Color','b');