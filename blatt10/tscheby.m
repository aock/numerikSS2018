function x = tscheby(n)
    x = [];
    for j = 0:n-1
        x = [cos( ( (2*j+1) * pi ) / (2*n) ) , x];
    end
    x = unique(x);
end