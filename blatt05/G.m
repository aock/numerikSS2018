function x=G(A,b,x_0,tol)

    m = size(A,1);
    n = size(A,2);

    if m < n
        % normalengleichung zweiter art.
        % solve A*A'*l = b for l
        l = G(A*A',b,x_0,tol);
        x = A'*l;
    elseif m > n
        b = A'*b;
        A = A'*A;
        x = G(A,b,x_0,tol);
    else
        % normalengleichung erster art. kleinste quadrate
        x = x_0;

        r = A * x - b;
        while norm(r) > tol
            % a' * b -> dot(a,b)
            a = r' * r / (r' * A * r);
            x = x - a * r;
            r = A * x - b;
        end

    end


end
