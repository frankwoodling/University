function [ P1, P2, P3, P4 ] = ellipse_perim(a,b)

% There is no simple way to calculate the perimeter of an ellipse
% so we must approximate it.  Given the radius of each direction of the 
% ellipse we can approximate it in multiple ways.

% Used to calculate the values of P2, P3, P4
h = ((a-b)/(a+b))^2;

%  Approximations
P1 = pi*sqrt(2*(a^2+b^2)-((a-b)^2/2));
P2 = pi*(a+b)*(1+(h/8))^2;
P3 = pi*(a+b)*((256-48*h-21*h^2)/(256-112*h+3*h^2));
P4 = pi*(a+b)*((3-sqrt(1-h))/2);


end

