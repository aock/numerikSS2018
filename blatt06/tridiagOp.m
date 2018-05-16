function y = tridiagOp(x)
    n = size(x,1);
    
    y = zeros(n,1);


    % first
    y(1) = 2 * x(1) - x(2);

    for i = 2:n-1
        y(i) = 2*x(i) - x(i-1) - x(i+1);
    end

    % last
    y(n) = 2 * x(n) - x(n-1);

end
