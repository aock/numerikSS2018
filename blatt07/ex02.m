%% Aufgabe 2
%% b)

dbtype PolyNewtonSchritt
dbtype PolySekantenSchritt

polynom = [1,2,3];
xn1 = 0;
xs1 = -0.00001;
xs2 = 0.00001;

xn2 = PolyNewtonSchritt(polynom,xn1);

xs3 = PolySekantenSchritt(polynom,xs1,xs2);

fprintf('polynom :\n');
disp(polynom);

fprintf('PolyNewtonSchritt mit x1=%f:\n', xn1);
fprintf('x2=%f\n', xn2);

fprintf('\n');

fprintf('PolySekantenSchritt mit x1=%f, x2=%f:\n', xs1, xs2);
fprintf('x3=%f\n', xs3);

%% c)
a = 10^(-4);
p = [1;a;0];

x = 1;
e_x_newton = [];
% newton verfahren
while x ~= 0
    x = PolyNewtonSchritt(p,x);
    e_x_newton = [e_x_newton,abs(x)];
end

iter_newton = 1:1:length(e_x_newton);

% sekanten verfahren
x = 1;
x2 = 0.9;

e_x_sek = [];
while x ~= 0
    x_new = PolySekantenSchritt(p, x, x2);
    e_x_sek = [e_x_sek,abs(x_new)];
    x2 = x;
    x = x_new;
end

iter_sek = 1:1:length(e_x_sek);


% Ordnungen des Newton- und Sekantenverfahrens bestimmen
ord_newton = @(k) log(e_x_newton(k)) / log(e_x_newton(k-1));
ord_sek = @(k) log(e_x_sek(k)) / log(e_x_sek(k-1));

ord_newton_vec = [];
for i = 2:length(e_x_newton)
    ord_newton_vec = [ord_newton_vec, ord_newton(i)];
end

ord_sek_vec = [];
for i = 2:length(e_x_sek)
    ord_sek_vec = [ord_sek_vec, ord_sek(i)];
end


% plotting

figure
ax1 = subplot(2,2,1);
semilogy(ax1,iter_newton,e_x_newton)
title(ax1,'Newton Verfahren')
ylabel(ax1,'Fehler')
xlabel(ax1,'Iteration')

ax2 = subplot(2,2,2);
semilogy(ax2,iter_sek,e_x_sek)
title(ax2,'Sekanten Verfahren')
ylabel(ax2,'Fehler')
xlabel(ax2,'Iteration')

ax3 = subplot(2,2,3);
plot(ax3,iter_newton(2:end),ord_newton_vec)
title(ax3,'Ordnung Newtonverfahren')
ylabel(ax3,'Ordnung')
xlabel(ax3,'Iteration')

ax4 = subplot(2,2,4);
plot(ax4,iter_sek(2:end),ord_sek_vec)
title(ax4,'Ordnung Sekantenverfahren')
ylabel(ax4, 'Ordnung')
xlabel(ax4, 'Iteration')




