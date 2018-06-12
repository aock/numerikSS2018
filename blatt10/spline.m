function y=spline(c,x)
    if x<0 | x >2
        y = 0;
    elseif x <= 1
        y = c(1) + c(2)*x + c(3)*x^2 + c(4)*x^3;
    else
        y = c(5) + c(6)*(x-1) + c(7)*(x-1)^2 + c(8) * (x-1)^3;
end