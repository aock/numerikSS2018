%% Aufgabe 5
dbtype newtonInterpolation

f = @(x) (x.^2 + 1).^(-1);
tscheby = @(x) cos( ((x.*2.0+1.0).*pi)./22.0 ).*5.0;


fig1 = figure(1);
x = linspace(-10,10,1000);

%% a) Aequidistant
X_A = linspace(-5,5,11);
fX_A = f(X_A);
y_a = newtonInterpolation(X_A,fX_A,x);

ax1 = subplot(2,1,1);
plot(ax1, X_A, fX_A,'o');
hold on
plot(ax1,x,y_a,'-');
axis(ax1, [-6 6 -1 2.5]);
legend(ax1, 'Runge', 'Interpolation')
title(ax1, 'Newton Interpolation: Runge-Funktion - Aequidistant')
hold off

%% b) Tschebyscheff
X_T = tscheby(linspace(0,10,11));
fX_T = f(X_T);
y_t = newtonInterpolation(X_T,fX_T,x);
ax2 = subplot(2,1,2);

plot(ax2, X_T, fX_T,'o');
hold on
plot(ax2,x,y_t,'-');
axis(ax2, [-6 6 -1 2.5]);
legend(ax2, 'Runge', 'Interpolation')
title(ax2, 'Newton Interpolation: Runge-Funktion - Tschebyscheff');
hold off


%% c) Approximationsfehler

% mitte der interpolationspunkte:

num_st = 11:30:1001;

err_a = [];
err_t = [];

for n=num_st
    X_A = linspace(-5,5,n);
    X_T = tscheby(linspace(0,10,n));
    X_A_M = (X_A(1:end-1) + X_A(2:end) ) ./ 2.0;
    X_T_M = (X_T(1:end-1) + X_T(2:end) ) ./ 2.0;
    fX_A = f(X_A);
    fX_T = f(X_T);
    y_a = newtonInterpolation(X_A,fX_A,X_A_M);
    y_t = newtonInterpolation(X_T,fX_T,X_T_M);

    f_a = f(X_A_M);
    f_t = f(X_T_M);

    err_a = [err_a, max(abs(f_a - y_a))];
    err_t = [err_t, max(abs(f_t - y_t))];

end

close(fig1);

fig2 = figure(2);
semilogy(num_st, err_a);
hold on
semilogy(num_st, err_t);
hold off
title('Approximationsfehler')
legend('Aequidistant', 'Tschebyscheff');
