%% Aufgabe 4

X = [-0.75, -0.3, 0.22, 0.9]
x = linspace(-1,1,101);

n = length(X);

figure(1)

%% Lagrange
ax1 = subplot(2,1,1);
title(ax1, 'Lagrange Basen')

hold on

y = lagrangeBasis(1,X,x);
plot(ax1,x,y,'-')
y = lagrangeBasis(2,X,x);
plot(ax1,x,y,'--')
y = lagrangeBasis(3,X,x);
plot(ax1,x,y,'-x')
y = lagrangeBasis(4,X,x);
plot(ax1,x,y,'-o')
ylabel(ax1,'y')
xlabel(ax1,'x')

hold off

legend(ax1,'k=1','k=2','k=3','k=4')

%% Newton

ax2 = subplot(2,1,2);
title(ax2, 'Newton Basen')

hold on

y = newtonBasis(1,X,x);
plot(ax2,x,y,'-')
y = newtonBasis(2,X,x);
plot(ax2,x,y,'--')
y = newtonBasis(3,X,x);
plot(ax2,x,y,'-x')
y = newtonBasis(4,X,x);
plot(ax2,x,y,'-o')
ylabel(ax2,'y')
xlabel(ax2,'x')

hold off

legend(ax2,'k=1','k=2','k=3','k=4')
