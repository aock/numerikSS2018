function [L,U] = epsLU(eps)
    L = [1,0;1/eps,1];
    U = [eps,1;0,eps-1/eps];
end
