%% Aufgabe 3


%% Original
% x,y original
xo = [0,1,2];
yo = [3,0,1];

%% Spline
% spline Koeffizienten:

A = [ [1 0 0 0 0 0 0 0];...
      [1 1 1 1 0 0 0 0];...
      [0 0 0 0 1 0 0 0];...
      [0 0 0 0 1 1 1 1];...
      [0 1 2 3 0 -1 0 0];...
      [0 0 1 3 0 0 -1 0];...
      [0 0 1 0 0 0 0 0];...
      [0 0 0 0 0 0 1 3]];

y = [3;0;0;1;0;0;0;0];

% cs: Spline koeffizienten
cs = A\y;

% x,y spline
xs = linspace(0,2,1001);
ys = [];

for x = xs
    ys = [ys, spline(cs,x)];
end

%% Quadratische Interpolation

A = [[1 0 0];[1 1 1];[1 2 4]];
y = [3;0;1];
% cq: Koeffizienten Quadratische Interpolation
cq = A\y;
xq = linspace(0,2,1001);
yq = quadric(xq,cq);

% quadric(0,cq)
% quadric(1,cq)
% quadric(2,cq)

%% Auswertung
figure(1)
plot(xo, yo, 'o');
hold on

plot(xs, ys, '-');
plot(xq, yq, '-.')

hold off

legend('Samples','Spline Interpolation','Quadratische Interpolation')