function y=lagrangeBasis(k,X,x)
    y = ones(size(x));
    n = length(X);
    for j=1:n
        if j ~= k
            y = y .* ( (x - X(j)) / X(k) - X(j) );
        end
    end
end