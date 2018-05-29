function x2 = PolyNewtonSchritt(Koeffizienten,x1)

% Horner-Schema:
alpha = 0;
beta = 0;
for a=Koeffizienten(1:end-1)
    alpha = a + alpha.*x1;
    beta = alpha + beta.*x1;
end
alpha = Koeffizienten(end) + alpha.*x1;  % Ein Schritt mehr als bei der Ableitung

% Newton-Schritt
x2 = x1 - alpha./beta;
