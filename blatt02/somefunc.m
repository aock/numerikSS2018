function y = somefunc(x,n)
    syms k;
    y = symsum(x.^k,k,[1,n]);
end
