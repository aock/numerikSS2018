function [xy2,num_lost] = NewtonLinesearchJacobi(f,J,xy1)
    % x2 = x1 - f(x1) / J(x1);
    % x2 = x1 - J(x1)^(-1) * f(x1)

    % inverse und multiplikation unguenstig. deshalb lieber LGS loesen:
    % J(x1,y1) * dxy = -f(x1,y1) 

    % newton schritt
    dxy = J(xy1(1),xy1(2)) \ (-f(xy1(1),xy1(2)));
    
    % dxy ergibt richtung
    %alpha = alphaFunc(xy1(1),xy1(2),dxy(1),dxy(2));
    alpha = 1.0;

    xy2 = xy1 + alpha*dxy;
    num_lost = 0;

    while norm(xy2) >= norm(xy1)
        alpha = alpha / 2.0;
        xy2 = xy1 + alpha * dxy;
        num_lost = num_lost + 1;
    end 

end
