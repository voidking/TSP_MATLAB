function PaintCount()

%X=[50 200 400 800];
%Y=[90.4 89.2 85.6 87.4];
%plot(X,Y);
%axis([0 800 0 100]);
%xlabel('种群数量');
%ylabel('找到最优解时的迭代次数');

%X=[0.1 0.3 0.6 0.9];
%Y=[74.7 95.6 97.4 65.2];
%plot(X,Y);
%axis([0 1 0 100]);
%xlabel('交叉概率');
%ylabel('找到最优解时的迭代次数');

X=[0.1 0.3 0.6 0.9];
Y=[92 95 68.6 69];
plot(X,Y);
axis([0 1 0 100]);
xlabel('变异概率');
ylabel('找到最优解时的迭代次数');