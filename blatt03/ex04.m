%% Aufgabe 4
dbtype('solveTridiag.m');

x_space = [3:200:5003];

a_val = 4;
b_val = 1;
c_val = 3;

runTimesThomas = [];
runTimesMatlab = [];

for n = x_space
    % vectors
    a = a_val*ones(n,1);
    b = b_val*ones(n-1,1);
    c = c_val*ones(n-1,1);
    f = rand(n,1);
    % Matrix
    A = diag(a, 0) + diag(b,-1) + diag(c, 1);

    tic
    x = solveTridiag(a,b,c,f);
    elapsedTime = toc;
    runTimesThomas = [runTimesThomas; elapsedTime];

    tic
    x = A \ f;
    elapsedTime = toc;
    runTimesMatlab = [runTimesMatlab; elapsedTime];
end

semilogy(x_space,runTimesThomas,'rx',x_space,runTimesMatlab,'b');
legend('runtime Thomas','runtime Matlab','Location','NorthWest')
