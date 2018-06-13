function y=newtonInterpolation(X,fX,x)

    n=length(fX);
    c=fX;
    coeff=[fX(1);zeros(n-1,1)];

    % dreiecksschema
    for j=1:n-1
        c = (c(2:n-j+1)-c(1:n-j))./(X(1+j:n)-X(1:n-j));
        coeff(j+1) = c(1);
    end


    % p(x) = sum_k^n f[x_0,..,x_k]*N_k(x)
    y = zeros(size(x));
    for k = 1:length(coeff)
        y = y + newtonBasis(k-1,X,x) .* coeff(k);
    end

end
