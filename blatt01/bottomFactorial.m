function [y,i] = bottomFactorial(M, k)
% Function approximate with factor against the condition (y+1)-y ~= 1
    y = M;
    i = 0;
    while (y+1)-y ~= 1
        y = y/k;
        i = i + 1;
    end
end
