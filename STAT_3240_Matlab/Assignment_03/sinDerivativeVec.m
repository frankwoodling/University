function [h_best,e_best]=sinDerivativeVec(x)
% The purpose of the function is to approximate the derivative
% of sin(x) without using a for loop.  Vector operations are
% used instead.  The minimal value is the least amount of error.

x_v = linspace((x),(x), 16);
n = 16;
h = logspace(-1,-16,n); 
e_h=zeros(1,n);

% Equation is split into 4 separate pieces.  The full equation is
% abs((sin(x+h)-sin(x))/h - cos(x)).
a = (sin(x_v+h)-sin(x_v));
b = rdivide(a,h); % rdivide divides two vectors
c = b - cos(x_v); 
d = abs(c); % takes absolute value of entire equation

e_best = min(d); % finds the minimum value in the vector
h_best_index = find(d == e_best); % finds the index of the min value
h_best = h(h_best_index); % sets the value of h that minimizes the equation

disp(h_best)
disp(e_best)
end
