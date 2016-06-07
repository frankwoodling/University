function n = countChar(c,A)
% c is a character
% A is a character array
% n is the number of time c occurs in A
n = length(find(A==c));
end