function [maxVal]=intervalMax(L,R)
% Function takes a left (L) and a right (L) integer and finds out
% where the maximum value of the cosine of all values in the interval.
% The maximum cosine is 1.  If the cosine is not 1 the max must be either
% the leftmost or rightmost integers.

% Equation for the function in the variable b.  Since the function finds 
% the minimum we must find the opposite of the given equation, which
% will give us the maximum.
a = @(x) -cos(x);

% Finds the minimum value on the interval by plugging all values in the 
% interval into the equation listed under the variable a.
b= fminbnd(a,L,R);

% Takes the value and converts it to the cosine value.
c = cos(b)

% THis section is used to determine whether the maximum is one of the
% endpoints or contained in the interval.  Returns the maximum value.
if b > L 
    if  b < R
        maxVal = c
    elseif cos(L) > cos(R)
        maxVal = cos(L);
    elseif cos(L) < cos(R)
        maxVal = cos(R);
    end
end
end
