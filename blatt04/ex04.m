%%% Aufgabe 4
%% a)

dbtype('jacobi.m');
dbtype('gauss_seidl.m');

%% b)

A = [8,1,1;1,4,1;1,1,4];
b = [10;6;6];

x_0 = [pi;exp(1);sqrt(2)];
n = 10;

x_jacobi = jacobi(A, b, x_0, n)

x_gauss_seidl = gauss_seidl(A, b, x_0, n)

%% c)

n = 3;

x = A \ b;

x_jacobi = jacobi(A, b, x_0, n);
x_gauss_seidl = gauss_seidl(A, b, x_0, n);

rel_jacobi = norm(x_jacobi - x);
rel_gauss_seidl = norm(x_gauss_seidl - x);

fprintf('Relativer Fehler Jacobi: %f\n', rel_jacobi);
fprintf('Relativer Fehler Gauss-Seidl %f\n', rel_gauss_seidl);

%% d)


