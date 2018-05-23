function x3 = PolySekantenSchritt(Koeffizienten,x1,x2)
    %% PolySekantenSchritt
    p = Koeffizienten;
    % get array dim
    [grad,argmin] = max(size(p));
    % reorder coeffs
    p = reshape(p,[grad,1]);
    
    f1 = horner(p,x1);
    f2 = horner(p,x2);

    x3 = x2 - (x2 - x1)/(f2 - f1) * f2;
end
