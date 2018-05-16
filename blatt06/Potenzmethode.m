function [Eigenvektor,rho,kstop] = Potenzmethode(Operator,z0,tol)

    k = 0;
    z = z0;
    mhi_old = 0;
    condition = 1;
    x_old = z0;

    while condition
        y = Operator(x_old);
        mhi = norm(y);
        x = y/mhi;

        if k > 0 && abs(mhi - mhi_old)/mhi < tol
            condition = 0;
        end

        mhi_old = mhi;
        x_old = x;
        k = k + 1;
    end

    Eigenvektor = x_old;
    kstop = k;
    rho = mhi_old;

end
