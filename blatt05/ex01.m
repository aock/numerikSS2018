%% Aufgabe 01
%% a) 

load('data.mat','data');

x = data(:,1);
y = data(:,2);

plot(x,y);

%% b)

% A*x = y. A?

% modelle
f_1 = @(x,a_1,a_2) a_1 + sqrt(a_2*x);
f_2 = @(x,b_1,b_2) b_1 + log((x+1)^b_2);
f_3 = @(x,c_1,c_2,c_3) c_1 + sqrt(c_2 * x) + log((x+1)^c_3);

% test models
f_1(2,2,2)
f_2(2,2,2)
f_3(2,2,2,2)


% params
% c)

dbtype('G.m');
dbtype('CG.m');

% d)

% 1.
A_1 = [1 2 3; 4 5 6];
b_1 = [7;7];
x_0 = [3;3];
tol = 10^(-10);

x_g = G(A_1,b_1,x_0,tol);
x_cg = CG(A_1,b_1,x_0,tol);
x_mat = A_1\b_1;

fprintf('1. Test\n');
fprintf('G:\n');
disp(x_g);

fprintf('CG:\n');
disp(x_cg);
 
fprintf('Matlab:\n');
disp(x_mat);

% 2.
A_2 = A_1';
b_2 = [1;2;2];
x_0 = [4;5];

x_g = G(A_2,b_2,x_0,tol);
x_cg = CG(A_2,b_2,x_0,tol);
x_mat = A_2\b_2;

fprintf('2. Test\n');
fprintf('G:\n');
disp(x_g);

fprintf('CG:\n');
disp(x_cg);

fprintf('Matlab:\n');
disp(x_mat);

%x

% probe

% A_2 * x


