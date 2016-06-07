function [Q] = CentroidPoints(P)
% Purpose of function is to find the centroid point of an array of points.
% The centroid is the mean of the x points and mean of the y points.
% P is a given structure of points
% Q is a structure with a single computed centroid point

% Initialize vectors
tot_x = 0;
tot_y = 0;
[x_size y_size] = size(P);

% Finds the sum of all x and y points
for i = 1:x_size
    tot_x = tot_x + P(i).x;
    tot_y = tot_y + P(i).y;
end

% Divides by the size of the initial array to get the mean for each point.
x_q = tot_x/x_size;
y_q = tot_y/x_size;

% Creates a structure with the computed centroid point
Q = struct('x',x_q,'y', y_q);

% Plotting options.
plotsOn = 'on';

x_vals = [];
y_vals = [];

for i = 1:length(P)
    x_vals = [x_vals P(i).x];
    y_vals = [y_vals P(i).y];
end

if strcmp(plotsOn, 'off')
    plot(x_vals,y_vals,'*')
    hold on
    plot(Q.x,Q.y,'O')
    Q.x
    Q.y
    title({'Test of Centroid Points'; 'Centeroid = (0.4771, 0.5047)'})
    saveas(gcf,'centroid_plot.pdf')
end
end