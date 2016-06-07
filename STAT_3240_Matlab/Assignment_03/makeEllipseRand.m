function [ xt,yt ] = makeEllipseRand(theta, n ,n_noise)


% Based on an ellipse equation this function will create a vector with
% values for n points and a tilt angle of theta. It will also add noise
% to every n_noise-th point.

% theta is the tilt angle of the plot
% n is the number of points to be plotted
% nNoise determines how often noise is added to points
% theta_r is theta converted to radians
% a and b are given values for the equation

theta_r = (pi*theta)/180;

a = 4;
b = 2;

% For xt and yt a vector is populated with n points between 0 and 2*pi
xt = linspace(0, 2*pi, n);
yt = linspace(0, 2*pi, n);

% The first index is always a noisy point
xt(1) = (4*cos(xt(1))*cos(theta_r)) - (2*sin(xt(1))*sin(theta_r))+((rand)-.5);
yt(1) = (2*sin(yt(1))*cos(theta_r)) + (4*cos(yt(1))*sin(theta_r))+((rand)-.5); 

% Goes through the indexes applying each to the equation.
% The rem function checks if each point should be a noisy point, and if so
% it adds a random number from -0.5 to 0.5
for i = 2:n
    if rem(i,n_noise) == 0
        xt(i) = (4*cos(xt(i))*cos(theta_r)) - (2*sin(xt(i))*sin(theta_r))+((rand)-.5);
        yt(i) = (2*sin(yt(i))*cos(theta_r)) + (4*cos(yt(i))*sin(theta_r))+((rand)-.5);
    else rem(i,n_noise) ~= 0
        xt(i) = (4*cos(xt(i))*cos(theta_r)) - (2*sin(xt(i))*sin(theta_r));
        yt(i) = (2*sin(yt(i))*cos(theta_r)) + (4*cos(yt(i))*sin(theta_r));
    end
end


% Plots final values of xt and yt, and saves the image as a pdf.
plot(xt,yt, '*')
title_text = sprintf('Noisy %d-Point Ellipse with Tilt angle %f', n, theta);
title(title_text)
xlabel('x(t)')
ylabel('y(t)')

%saveas(gcf,'myEllipseRand.pdf')

end






