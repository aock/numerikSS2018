function [a,b] = hornerVec(p,x_vec)
    a = [];
    b = [];

    for x = x_vec
        [a_tmp,b_tmp] = horner(p,x);
        a=[a,a_tmp];
        b=[b,b_tmp];
    end
end
