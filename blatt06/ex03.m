%% Aufgabe 3

%% a)
dbtype('tridiagOp.m');

x1 = [10000:10000:10^6];
rtimes = [];

for n = x1
    x = randn(n,1);
    timer_start = tic;
    
    tridiagOp(x);

    timer_end = toc(timer_start);
    rtimes = [rtimes;timer_end];
end

plot(x1,rtimes)
title('Laufzeit tridiagOp');

fprintf('finished\n');

%% b)

tol = 10^(-7);

n = 10;

x1 = [10:10:1000];
x2 = [1000:1000:10000];

% A^(-1) mit n=10^5 wuerde 74.5GB benoetigen -> daher 10000

% Potenzmethode

% Inverse Potenzmethode

rhos1 = [];
rhos2 = [];

% Tridiag Generator
a_gen = @(n) diag(2 * ones(n,1),0) + diag(-1*ones(n-1,1),-1) + diag(-1*ones(n-1,1), 1);
A_storage = a_gen(10000);
a_splice = @(n) A_storage(1:n,1:n);
% schneller als jedes mal die tridiganolmatrix zu erzeugen
% etwas mehr speicher wird benoetigt


for n = x1
    % build tridiagonal matrix
    A = a_splice(n);
    Operator = @(x) A*x;
    [tmp,rho1,tmp] = Potenzmethode(Operator,randn(n,1),tol);
    rhos1 = [rhos1; rho1];
end


for n = x2
    
    A = a_splice(n);
    Operator = @(x) A\x;
    [tmp,rho2,tmp] = Potenzmethode(Operator,randn(n,1),tol);
    rhos2 = [rhos2; rho2];

end

figure
ax1 = subplot(2,1,1);
plot(ax1,x1,rhos1);
title(ax1, 'Potenzmethode auf A');
ylabel(ax1, 'Spektralradius');
xlabel(ax1, 'n');

ax2 = subplot(2,1,2);
plot(ax2,x2,rhos2);
title(ax2, 'Potenzmethode auf A^(-1)');
ylabel(ax2, 'Spektralradius');
xlabel(ax2, 'n');



