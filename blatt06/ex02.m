%% Aufgabe 02
dbtype('Potenzmethode.m');

A = [1 0 -2; 1 3 1; 1 0 4];

Operator1 = @(x) A*x;
Operator2 = @(x) A\x;

tol = 10^(-10);
z_0 = [1;1;1];


[Eigenvektor1,rho1,kstop1] = Potenzmethode(Operator1,z_0,tol);

fprintf('Potenzmethode mit Operator f(x) = A*x:\n');
fprintf('Eigenvektor:\n');
disp(Eigenvektor1);
fprintf('Spektralradius:\n');
disp(rho1);
fprintf('Anzahl Iterationen:\n');
disp(kstop1);


[Eigenvektor2,rho2,kstop2] = Potenzmethode(Operator2,z_0,tol);
fprintf('Potenzmethode mit Operator f(x) = A\\x:\n');
fprintf('Eigenvektor:\n');
disp(Eigenvektor2);
fprintf('Spektralradius:\n');
disp(rho2);
fprintf('Anzahl Iterationen:\n');
disp(kstop2);
