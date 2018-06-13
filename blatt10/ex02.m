%% Aufgabe 2

%% Hilfsfunktionen (altes Blatt)
dbtype newtonBasis
dbtype newtonInterpolation
dbtype tscheby

%% a) Tschebyscheff Interpolation
s_vec = [1,2,3,4];
f = @(x,s) tanh(x.*s);
err_f_p = @(f,p) max( abs( f - p ) );

n_max = 25;
n_vec = 1:n_max;

x = linspace(-1,1,101);

error_s = [];


for s = s_vec
    y = f(x,s);
    curr_err = [];

    for n = n_vec
        x_s = tscheby(n);
        y_s = f(x_s,s);
        y_t = newtonInterpolation(x_s,y_s,x);

        c_err = err_f_p(y,y_t);
        curr_err = [curr_err, c_err];

    end
    error_s = [error_s; curr_err];
end

%% b) Regression
error_s_log = log(error_s);
p1 = polyfit(n_vec, error_s_log(1,:), 1);
p2 = polyfit(n_vec, error_s_log(2,:), 1);
p3 = polyfit(n_vec, error_s_log(3,:), 1);
p4 = polyfit(n_vec, error_s_log(4,:), 1);

%% Plot

figure(1)
semilogy( n_vec,error_s(1,:));
hold on;
semilogy( n_vec, exp( polyval(p1, n_vec) ) );
semilogy( n_vec,error_s(2,:),'-.');
semilogy( n_vec, exp( polyval(p2, n_vec) ) );
semilogy( n_vec,error_s(3,:),'--');
semilogy( n_vec, exp( polyval(p3, n_vec) ) );
semilogy( n_vec,error_s(4,:),'-x');
semilogy( n_vec, exp( polyval(p4, n_vec) ) );
% regressions

legend('s = 1', sprintf('Regression (s=1): c=%f', p1(1) ), ...
    's = 2', sprintf('Regression (s=2): c=%f', p2(1) ), ...
    's = 3', sprintf('Regression (s=3): c=%f', p3(1) ), ...
    's = 4', sprintf('Regression (s=4): c=%f', p4(1) ) );
xlabel('n');
ylabel('Fehler');
title('Fehler der Tschebyscheff Interpolation + Regression');
hold off;

