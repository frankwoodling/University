function [h_best,e_best]=sinDerivative(x)
% Purpose of function is to approximate the derivative of sin
% using a log vector and error equation. The points are then plotted.

% n is the size of the vectors
% h creates a log vector of n elements
n = 16; 
h = logspace(-1,-16,n); 

% since we are looking for an extremely small value inital value of 
% e_best (the minimum outcome) is set to a high number
e_best = 10E6; 

% populates an n size vector to be replaced with computed values
e_h=zeros(1,n);

% The loop will go through the vector plugging each log value and x into
% the given equation.  Each time it finds a new minimum it will overwrite
% the best value of e_best.
for k = 1:n
e_h(k) = abs((sin(x+h(k))-sin(x))/h(k) - cos(x));
if e_h(k) < e_best
   e_best = e_h(k);
   h_best = h(k);
end
end

% creates a log plot showing each error value and saves a pdf of the plot
set(gca,'XDir','reverse')
loglog(h, e_h, '*')
title(sprintf('Error in Derivative of Sin Approximation x=%d radians', x))
xlabel('h')
ylabel('error')
set(gca,'XDir','reverse')

% saveas(gcf,'derivativeError.pdf')

end

