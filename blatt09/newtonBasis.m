function y=newtonBasis(k,X,x)
    y = ones( size(x) );

    if k > 0
        for j = 1:k
            y = y .* ( x - X(j) );
        end
    end
end