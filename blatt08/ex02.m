%% Aufgabe 2
%% a)
clear

exa = 0;
exb = 1;

if exa

f1 = @(x,y,alpha) x.^2 - y + alpha;
f2 = @(x,y,alpha) -x + y.^2 + alpha;
f = @(x,y,alpha) cat( ndims(x)+1, f1(x,y,alpha), f2(x,y,alpha) );


x = linspace(-10,10,21);
y = linspace(-10,10,21);

[mx,my] = meshgrid(x,y);

alphas = [-1.5,-1,-3.0/4.0,0,1.0/4.0,1];

fig1 = figure(1);

% define parent ui
p = uipanel('Parent',fig1,'BorderType','none');
p.Title = 'Visualisation of: f1,f2'; 
p.TitlePosition = 'centertop'; 
p.FontSize = 12;
p.FontWeight = 'bold';

% rotating subplots
axes = [];
for idx = 1:length(alphas)
    axes = [axes,subplot(3,2,idx,'Parent',p)];
    ax = axes(end);
    z = f(mx,my,alphas(idx));
    z1 = z(:,:,1);
    z2 = z(:,:,2);
    hold on
    
    s1 = surf(ax,x,y,z1);
    s1.EdgeColor = [1 0 0];
    s1.FaceColor = 'interp';
    s2 = surf(ax,x,y,z2);
    s2.FaceColor = 'interp';
    
    
    xlabel(ax,'x');
    ylabel(ax,'y');
    zlabel(ax,'z');
    title(ax, sprintf('alpha: %f', alphas(idx) ) );
    
    hold off
    rotate3d on;
end

end

%% b)

if exb

% funktionen aus aufgabe
f = @(x,y,alpha) [x^2 - y + alpha; -x + y^2 + alpha];
J = @(x,y) [2*x, -1; -1, 2*y];

% funktion mit alpha = -3/4
f1 = @(x,y) f(x,y,-3/4);

x1 = 2;
y1 = 0;

xy_old = [x1 - 1.0; y1 - 1.0];
xy_new = [x1; y1];
itNewton = 0;
% eps ist zu klein: 'Matrix is singular to working precision.' -> waehl eps = 1e-8 
while norm(xy_new - xy_old) > 1e-8
    xy_old = xy_new;
    xy_new = NewtonJacobi(f1,J,xy_old);
    itNewton = itNewton +1;
end
xy_inf = xy_new;

disp('Klassisches Newton-Verfahren xy_inf: ')
disp(xy_inf)
fprintf('Anzahl Iterationen %d\n', itNewton); 

% Newton mit line search 

xy_old = [x1 - 1.0; y1 - 1.0];
xy_new = [x1; y1];
itNewtonLine = 0;
num_lost = 0;

while norm(xy_new - xy_old) > 1e-8
    xy_old = xy_new;
    [xy_new,nl] = NewtonLinesearchJacobi(f1,J,xy_old);
    num_lost = num_lost + nl;
    itNewtonLine = itNewtonLine + 1;
end
xy_inf = xy_new;

disp('Linesearch Newton-Verfahren xy_inf: ')
disp(xy_inf)
fprintf('Anzahl Iterationen %d\n', itNewtonLine); 
fprintf('Anzahl verworfener Punkte: %d\n', num_lost);


end
