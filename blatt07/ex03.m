a_vec = [5,10];

iter=100;

figure
ax = [subplot(2,1,1),subplot(2,1,2)];

curr_ax = 1;
for a = a_vec
    x_vals = linspace(-sqrt(a)-1,sqrt(a)+1,100);
    p = [-1;0;a;-1];
    
    % left
    
    y_vals = x_vals;
    
    for i = 1:length(y_vals)
        for j = 1:iter
            y_vals(i) = PolyNewtonSchritt(p,y_vals(i));
        end
    end

    scatter(ax(curr_ax),x_vals,y_vals)
    curr_ax = curr_ax + 1;

end


title(ax(1),'a=5')
ylabel(ax(1),'Erkannte Nullstelle')
xlabel(ax(1),'x0')
title(ax(2),'a=10')
ylabel(ax(2),'Erkannte Nullstelle')
xlabel(ax(2),'x0')

