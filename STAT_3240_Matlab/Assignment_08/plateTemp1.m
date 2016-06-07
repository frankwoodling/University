function [TVals]=plateTemp1(n,hs,plotsOn)
% Function creates a plot and computes temperatures of an n-by-n grid with
% two heat sources.

% Populates x and y vectors for use in the given equation.
x = linspace(0,6,n);
y = linspace(0,4,n);

% Calculates a vector that shows the temperature with two heat plates
% contained in the variable hs.
T_plate2 = @(x,y) T_plate1(x,y,hs);
TVals = fOnGrid(x,y,T_plate2);

% Plots a contour graph of the temperatures through the n by n area.
if strcmp(plotsOn,'on') == 1
    contour(x,y,TVals,20)
    
    % I haven't been able to get variables to work in titles the last few
    % assignments.  It always gives me a single number or repeats the title
    % even if I use func2str.
    
    % title_str = func2str(hs) % Does not work
    %title(fprintf('Cross-Section of Temperature Grid for heat source locations %d',title_str))
    title('Cross-Section of Temperature Grid for heat source locations (2,1) to (4.5,3)')
    xlabel('x')
    ylabel('y')
    %saveas(gcf,'plateTemp1.pdf')
end
end



function fVals = fOnGrid(x,y,f)
% x is a 1-by-n vector
% y is a 1-by-m vector
% f is a function handle that identifies a function 
% of two variables.
% fVals is an m-by-n matrix where 
% fVals(i,j) = f(x(j),y(i)).

n = length(x); m = length(y); 
fVals = zeros(m,n);
for j=1:n
    for i = 1:m
        fVals(i,j) = f(x(j),y(i));
    end
end
end