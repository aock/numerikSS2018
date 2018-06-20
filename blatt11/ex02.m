%% Aufgabe 2
f1 = @(x) (x + 1).^(-1);
If1 = log(2);

f2 = @(x) x.^3.*sin(42*pi*x);
If2 = (1 - 294*pi^2)/(12348*pi^3);

T2k_1 = [];
err_1 = [];
T2k_2 = [];
err_2 = [];

for k = 0:10
    % berechnung von T2k
    if k == 0
        T2k_1 = [T2k_1, (f1(0) + f1(1))/2];
        T2k_2 = [T2k_2, (f2(0) + f2(1))/2];
    else
        T2k_1 = [T2k_1, 1/2 * T2k_1(end) + 1/(2^(k+1))*sum( f1( ([1:2^k] - 1)./(2^(k+1)) ) )];
        T2k_2 = [T2k_2, 1/2 * T2k_2(end) + 1/(2^(k+1))*sum( f2( ([1:2^k] - 1)./(2^(k+1)) ) )];
    end

    err_1 = [err_1, abs(T2k_1(end) - If1)];
    err_2 = [err_2, abs(T2k_2(end) - If2)];

end

figure(1)
semilogy(0:10, err_1,'.-')
hold on
semilogy(0:10, err_2)
hold off
legend('Fehler T[f1]','Fehler T[f2]');

