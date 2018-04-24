function [L,U] = epsLUPivot(eps)
    A = [eps,1;1,eps];
    P = [0,1;1,0];
    [L,U] = lu(P*A);
end
