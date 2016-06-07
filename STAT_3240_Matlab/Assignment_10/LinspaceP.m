function P = linspaceP(Q1, Q2, n)
% Q1 and Q2 are points.
% n is an integer >= 2
% P is a length n structure array of points with the property that
% P(1),...,P(n) are equally spaced along the line segment
% that connects Q1 and Q2. Note: P(1) = Q1 and P(n) = Q2.

% Creates an x and y vector of n linearly spaces points.
x = linspace(Q1.x, Q2.x, n);
y = linspace(Q1.y, Q2.y, n);

% Creates a structure with the points previously calculated
P_init = struct('x', 1, 'y', 1);
P = repmat(P_init, n, 1);

for i = 1:n
   P(i) = struct('x', x(i), 'y', y(i));
end


% Plotting 
plotsOn = 'off';
if strcmp(plotsOn, 'on')
end_x=  [x(1) x(n)];
end_y= [y(1) y(n)];

plot(end_x, end_y, 'O')
hold on
plot(x,y,'*')
axis([0,10,0,10])
title('Test of linespaceP')
saveas(gcf,'linspace_plot3.pdf')
end
end