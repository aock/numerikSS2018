%% Aufgabe 1

f = @(x) x.^(1/2);
p = @(x) 1+1/3*(x-1) - 1/60 * (x-4).*(x-1);
q = @(x) x - 1/6 * (x-1).*x + 1/60 * (x-4).*(x-1).*x;

x = linspace(0,10,101);
yf = f(x);
yp = p(x);
yq = q(x);

figure(1)
plot(x,yf);
hold on
plot(x,yp,'-x');
plot(x,yq,'--');
hold off
legend('f = sqrt(x)','p aus P_2','q aus P_3');
