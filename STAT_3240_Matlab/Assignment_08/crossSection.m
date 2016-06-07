function [TVals]=crossSection(n,hs,endpts,plotsOn)
% Creates a cross-section of n points of the temperatures for a given
% distance from a point.

% Populates vectors for the specified grid size.
t = linspace(0,1,n);
x = linspace(endpts(1,1),endpts(2,1),n);
y = linspace(endpts(1,2),endpts(2,2),n);
f = zeros(1,n);

% Calculates temperates at specific distances from a given point.
for i=1:n
    f(i)=T_plate(x(i),y(i));
end
TVals = T_plate1(x,y,hs);

% Plots temperature vs the distance from a point.
if strcmp(plotsOn, 'on') == 1    
    plot(t,TVals);
    title('Cross-Section of Temperature Grid for heat source locations (2,1) to (4,5,3)')
    xlabel('Fraction of distance from (1,1) to (5,3)')
    ylabel('Temperature')
    %saveas(gcf,'crossSection.pdf')
end