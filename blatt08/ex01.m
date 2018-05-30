%% Aufgabe 1
%% a)

clear
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

fprintf('a) Nullstellen: \n');

zs = zs(idx);
disp(zs);

%% b)

x = -10-10i;

xz = [x - 1.0, x];

while norm(xz(end) - xz(end-1)) > eps
    xz = [xz,PolyNewtonSchritt(p,xz(end))];
end

disp('b):');
xinf = xz(end);
fprintf('xinf: %f %+fi\n', real(xinf), imag(xinf));

pkavg = [];

% ck = e

for idx = 3:length(xz)-1
    pk1 = log(abs(xz(idx-2) - xinf)) / log(abs(xz(idx-1) - xinf));
    pk2 = log(abs(xz(idx-1) - xinf)) / log(abs(xz(idx) - xinf));
    pkavg = [pkavg, (pk1 + pk2)/2.0];
end

x = 1:1:length(pkavg);

figure(1)
plot(x,pkavg)
xlabel('k')
ylabel('p_k')
title('Konvergenzrate p_k');







