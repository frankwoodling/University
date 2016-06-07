function [ f ] = makeVec(n)
% This code generates a length-10 vector according to a recursion formula.
% Function takes a value and creates a vector based off each preceding
% value.

f = zeros(1,10); % Creates a vector of length 10 with all zeros.
k = 0; % Used to index through vector f.

while k < 10
    k = k + 1;
    if k == 1
        f(1) = n; % The first index is always equal to the given n value.
    else
        if rem(f(k-1),2) ~= 0
            f(k) = 3*f(k-1)+1; % If previous index is odd run this.
        else
            f(k) = f(k-1)/2; % If previous index is even run this.
        end
    end
end
end
