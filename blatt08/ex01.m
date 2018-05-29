clear
%% Aufgabe 1
%% a)

% functions
f = @(x) x.^5 - x.^4 * 2 + x.^2*3 - 3 * x + 1;
df = @(x) 5*x.^4 - 8*x.^3 + 6*x - 3;
x = linspace(-10,10,100);

figure(1);
hold on
plot(x,f(x))
plot(x,df(x))
legend('f','f''');
hold off

% polynom coefficients
p = [1,-2,0,3,-3,1];


x = 2;

xs = linspace(-10-10i,10+10i,800);

zs_old = xs - 1.0;
zs_new = xs;

while norm(zs_new - zs_old) > eps
    zs_old = zs_new;
    zs_new = PolyNewtonSchritt(p,zs_old);
end
zs = zs_new;

[~,idx] = unique(round(zs ./ (0.001 * (1+i))));

zs = zs(idx)

%% b)


