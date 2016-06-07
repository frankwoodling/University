function [ root_correct ] = findRoot1(x0, tol)

% Purpose of function is use another function to find roots and plot them.
% This function will put an interval of points into a vector before
% plotting.

% The function to be plotted.
f=@(x) 3*x^4 -5*x^3 - 12*x^2;
fDeriv=@(x) 12*x^3-15*x^2-24*x;

% Sets the minimum, maximum, and number of points of the interval.
x_min = -2;
x_max = 3.25;
points = 50;

% Calls the newtonRoot function in order to find the correct root values
root_correct = newtonRoot(f,fDeriv,x0,tol);

% Creates two vectors of the intervals specified above.
% The second will be overwritten with function values while the first
% is for the x axis.
x = linspace(x_min, x_max, points);
root_vec = linspace(x_min, x_max, points);

% Loop runs through each value of the vector and replaces the index
% value with each f(x).
for i = 1:points
    root_vec(i) = f(root_vec(i));
end

plot(x,root_vec, 'color', [0 0.502 0.502]);
hold all
plot(0,f(0), '-bs', 'MarkerEdgeColor', 'blue');
plot(1.8,f(1.8), '-mo', 'MarkerEdgeColor', 'red');

grid on;

title('Roots of f(x)=3*x^4 -5*x^3 - 12*x^2 Using Newtons Method: Anonymous Functions')

xlabel('f(x)');
ylabel('x');
legend('f(x)', 'f(x)=0', 'f(x0)', 'location','north');

%saveas(gcf,'findRoot1.pdf')
end


function [ root_correct] = newtonRoot(f,fDeriv,x0,tol)
% Purpose of function is to find the root of a scalar function using
% Newton's method.  Each iteration gets closer to the true root.
% The function will stop when it either meets tolerance or runs
% 1000 times.

k = 0;
root_correct = x0 - f(x0)/fDeriv(x0);

% root_correct is continuosly updated until it meets tolerance.
while abs(f(root_correct)) > tol && k < 1000
    k = k + 1;
    root_correct = root_correct - f(root_correct)/fDeriv(root_correct);
    
end
end
