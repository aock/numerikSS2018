function [a,b] = horner(p,x)

alpha = [0];
beta = [0];


% get array dim
[grad,argmin] = max(size(p));
 
% reorder coeffs
p = reshape(p,[grad,1]);


for i = 1:grad
    alpha = [p(i) + alpha(1)*x, alpha];
    beta = [alpha(1) + beta(1)*x , beta];
end

a = alpha(1);
b = beta(2);

