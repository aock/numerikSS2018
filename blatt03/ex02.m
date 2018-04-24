


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

figure
semilogy(x,cond_L,x,cond_L_pivot)

figure
semilogy(x,cond_U,x,cond_U_pivot)



