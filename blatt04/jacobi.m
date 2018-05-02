function x = jacobi(A,b,x_0,n)
	m = size(A,1);
		
	x_0_tmp = x_0;
	
	for k=[0:n]
		for i=1:m
			tmp=0;
			for j=[1:i-1,i+1:m]
				tmp = tmp + A(i,j) * x_0(j);
			end
			x_0_tmp(i) = (b(i) - tmp)/(A(i,i));
		end
		
		x_0 = x_0_tmp;
	end
	x = x_0_tmp;
end
