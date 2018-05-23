function x2 = PolyNewtonSchritt(Koeffizienten,x1)
    p = Koeffizienten;
    % get array dim
    [grad,argmin] = max(size(p));
    % reorder coeffs
    p = reshape(p,[grad,1]);

    [f1,df1] = horner(p,x1);

    x2 = x1 - f1/df1;

end
