function [TVals]=plateTemp2(n,hs,plotsOn)
% Computes temperatures of an n-by-n area with 2 heat sources using the
% Matlab build in function, meshgrid.

% Populates vectors of the size to be reported.
x = linspace(0,6,n);
y = linspace(0,4,n);

% Creates a matrix of temperates for each area throughout the grid.
T_plate2 = @(x,y) T_plate1(x,y,hs);
[X,Y] = meshgrid(x,y);
[TVals] = T_plate2(X,Y);

end

function tau = T_plate1(x,y,hs)

tau = 100*exp(-.4*(  (x-hs(1,1)).^2 + 0.7*(y-hs(1,2)).^2)) + ...
      80*exp(-.2*(2*(x-hs(2,1)).^2 + 1.5*(y-hs(2,2)).^2));

end