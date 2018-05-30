function xy2 = NewtonJacobi(f,J,xy1)
    % x2 = x1 - f(x1) / J(x1);
    % x2 = x1 - J(x1)^(-1) * f(x1)

    % inverse und multiplikation unguenstig. deshalb lieber LGS loesen:
    % J(x1,y1) * dxy = -f(x1,y1)
    
    dxy = J(xy1(1),xy1(2)) \ (-f(xy1(1),xy1(2)));
    xy2 = xy1 + dxy;
end
