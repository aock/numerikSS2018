%%% Aufgabe 2
dbtype('roundTest.m');
a = 0.5;
b = 0.5;
c = 0.5;

if roundTest(a,b,c)
    fprintf('Mit den Werten a = %f, b = %f, c = %f gilt das Assoziativgesetz nicht.\n', a, b, c);
else
    fprintf('Mit den Werten a = %f, b = %f, c = %f gilt das Assoziativgesetz.\n', a, b, c);
end

