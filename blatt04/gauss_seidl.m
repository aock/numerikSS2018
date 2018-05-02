function x=gauss_seidl(A,b,x_0,n)
    x = x_0;
    m = size(x,1);
    for itr=1:n
        x_old = x;
        for i=1:m
            sigma = 0;

            for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
            end

            for j=i+1:m
                sigma=sigma+A(i,j)*x_old(j);
            end
            
            % update x
            x(i) = (1/A(i,i))*(b(i)-sigma);
        end
    end
end
