function y = splineN(m,k,x_k_func,x)
    if m==0
        % Indikatorfunktion von x_k bis x_(k+1)
        left = x_k_func(k);
        right = x_k_func(k+1);
        ind = zeros(size(x));
        ind(find(left<=x & x<right)) = 1;
        y = ind;
    else        
        y = (x - x_k_func(k))/(x_k_func(k+m) - x_k_func(k)) .* splineN(m-1,k,x_k_func,x) ...
            + (x_k_func(k+m+1) - x )/(x_k_func(k+m+1) - x_k_func(k+1)) .* splineN(m-1,k+1,x_k_func,x);
    end
end
