%% Aufgabe 2

dbtype('epsLU.m');
dbtype('epsLUPivot.m');

x = linspace(10^(-7),1-10^(-7),100);

cond_L = [];
cond_U = [];
cond_L_pivot = [];
cond_U_pivot = [];

for eps = x
    [L,U] = epsLU(eps);
    cond_L = [cond_L; cond(L)];
    cond_U = [cond_U; cond(U)];
    [L,U] = epsLUPivot(eps);
    cond_L_pivot = [cond_L_pivot; cond(L)];
    cond_U_pivot = [cond_U_pivot; cond(U)];
end

semilogy(x,cond_L,'rx',x,cond_L_pivot,'r',...
        x,cond_U,'bx',x,cond_U_pivot,'b');
legend('cond(L)','cond(L) mit Pivotisierung','cond(U)','cond(U) mit Pivotisierung','Location','NorthWest')

