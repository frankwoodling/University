function [ xt,yt ] = makeEllipse(theta, n )

% Based on an ellipse equation this function will create a vector with
% values for n points and a tilt angle of theta. 

theta_r = (pi/180)*theta; % converts degrees to radians

% a and b are given values
a = 4;
b = 2;

% t is a vector with n elements between 0 and 2*pi
t = linspace(0, 2*pi, n);

% xt and yt are vectors that hold the points with x and y positions
xt = (a*cos(t)*cos(theta_r))-(b*sin(t)*sin(theta_r));
yt = (b*sin(t)*cos(theta_r))+(a*cos(t)*sin(theta_r));

% The points are plotted with * marking each point.
plot(xt,yt, 'Marker', '*')
title_text = sprintf('%d-Point Ellipse with Tilt angle %f', n, theta);
title(title_text)
xlabel('x(t)')
ylabel('y(t)')

% saveas(gcf,'myEllipse.pdf') % Used to save a pdf of the plotted image.

end


