%% Aufgabe 1 b)

x_k_func = @(k) k;

x = linspace(-1,4,101);

N_0_0 = splineN(0,0,x_k_func,x);
N_1_0 = splineN(1,0,x_k_func,x);
N_2_0 = splineN(2,0,x_k_func,x);

figure(1)
plot(x,N_0_0)
hold on
plot(x,N_1_0,'--')
plot(x,N_2_0,'-o')
hold off
legend('N^0_0','N^1_0','N^2_0');
xlabel('x');
ylabel('y');
title('Spline N^m_k');

