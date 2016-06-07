function [Q1,Q2,Q3]= SortPoints(P)
% Purpose of function is to take a set of points and sort them by distance 
% to origin. Function also finds the centroid and nearest point to the
% centroid.
%
% P is the inital structure of points
% Q1 is the median of the distances
% Q2 is the nearest point to the centroid
% Q3 is the centroid point 

% Initialize vectors and find the size of the vector.
d_vec =[];
[h, k] = size(P);
d2Cent_vec = [];

% finds the distance to the origin for each point
for i = 1:h
    x_val = P(i).x;
    y_val = P(i).y;
    d = sqrt((x_val-0)^2+(y_val-0)^2);
    d_vec = [d_vec d];
end

% sorts the computed distance vector by index
[sorted_vec index_vec] = sort(d_vec);

% finds the centroid point (mean of x and y points)
Q3 = CentroidPoints(P);

% finds the median by dividing by two and rounding
Q1_index = round(h/2);
Q1 = P(index_vec(Q1_index));

% finds the distance of each point to the computed centroid point
for j = 1:h
    x_val = P(j).x;
    y_val = P(j).y;
    d2Cent = sqrt((x_val-Q3.x)^2+(y_val-Q3.y)^2);
    d2Cent_vec = [d2Cent_vec d2Cent];
end

% finds the index of the closest point to the centroid point
[sorted_vec index_vec2] = sort(d2Cent_vec);
Q2 = P(index_vec2(1));

% Plotting options
plotsOn = 'off';
if strcmp(plotsOn, 'on')
    
x_vals = [];
y_vals = [];

for i = 1:length(P)
    x_vals = [x_vals P(i).x];
    y_vals = [y_vals P(i).y];
end

plot(x_vals,y_vals,'*')
hold on
plot(Q3.x, Q3.y, 'O')
title({'Test of SortPoints'; 'Approximate Centroid=(0.4771,0.5047)'})
xlab = 'x';
ylab = 'y';
saveas(gcf, 'sortpoints_plot.pdf')
end
end