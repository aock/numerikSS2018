function [y,i] = bottomAddition(M,k)
    y = M;
    i = 0;
    while (y+1)-y ~= 1
        y = y - k;
        i = i + 1;
    end
end
