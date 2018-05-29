%% Aufgabe 2
%% a)
clear

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


