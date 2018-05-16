function x = CG(A,b,x_0,tol)

    m = size(A,1);
    n = size(A,2);

    if m < n
        % normalengleichung zweiter art
        B = A*A';
        l = CG(A*A',b,x_0,tol); 
        x = A'*l;
    elseif m > n
        % normalengleichung erster art. kleinste quadrate problem
        b = A'*b;
        A = A'*A;
        x = CG(A,b,x_0,tol);
    else
        % CG
        x = x_0;
        r = b - A*x;
        p = r;
        z = r' * r;
        v = A*p;
        a = z/(p'*v);
        
        while norm(r) > tol
            v = A * p;
            a = z/(p'*v);
            x = x + a*p;
            r = r - a*v;
            z_tmp = z;
            z = r' * r;
            p = r + (z/z_tmp) * p;
        end

    end
end
