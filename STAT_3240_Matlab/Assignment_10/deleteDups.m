function [ B ] = deleteDups( A )
% Purpose of function is to take a string and remove duplicates.
% A is a given string with possible duplicates
% B is the final vector with duplicate characters removed.

% Initialize output vector
B = [];

% Loops goes through each character and uses any to check if that character
% is in the given vector.  If the character is not found in B already it
% adds it.
for i = 1:length(A)
    if any(A(i)==B)==0
        B = [B A(i)];
    end
end
end