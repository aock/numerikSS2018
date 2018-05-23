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

