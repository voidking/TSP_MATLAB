function PaintResult(LengthBest, LengthAverage,AntNum,Alpha,Beta,Rho)
%plot([LengthBest LengthAverage]);
%legend('��̾���','ƽ������');

plot([LengthBest]);
legend('��̾���');

[MinValue Index]=min(LengthBest);
Label=['(',int2str(Index),',',int2str(MinValue),')'];
text(Index,MinValue,Label);
%content=['���ϸ���Ϊ',int2str(AntNum)];
%content=['��Ϣ����ʽ����Ϊ',num2str(Alpha)];
%content=['����ֵ����ʽ����Ϊ',num2str(Beta)];
content=['��Ϣ�ػӷ�����Ϊ',num2str(Rho)];
title(content,'fontsize',10,'Color','b');