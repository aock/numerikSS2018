function x=solveTridiag(a,b,c,f)
    b = [1;b];
    n = length(f);
    v = zeros(n,1);
    y = v;
    w = a(1);
    x(1) = f(1)/w;
    for i=2:n
        v(i-1) = c(i-1)/w;
        w = a(i) - b(i)*v(i-1);
        x(i) = ( f(i) - b(i) * x(i-1) )/w;
    end
    for j=n-1:-1:1
        x(j) = x(j) - v(j) * x(j+1);
    end
    x = x.';
end
