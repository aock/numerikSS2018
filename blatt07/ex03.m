a_vec = [5,10];

iter=100;


x0 = [1;2;3];
test = [1;2;3];


[y0,dy0] = horner(test,x0)


for a = a_vec
    x_vals = linspace(-sqrt(a)-1,sqrt(a)+1,10);
    p = [-1;0;a;-1];
    
    % left
    
    y_vals = x_vals;
    for i = 1:iter
         y_vals = PolyNewtonSchritt(p,y_vals);
    end
%    x_vals
%    y_vals

end

