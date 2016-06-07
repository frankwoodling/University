function [ B ] = SortLength( C )
% Purpose of function is to take an array of strings, remove duplicates
% from strings, and sort them in descending order. 
% C is an array of strings
% B is an array of sorted strings with duplicates removed

% Initialize vectors
revB = {};
length_vec = [];
B = [];

% Creates a vector with duplicates removed and a vector of lengths
for i = 1:length(C)
    del_Dups = deleteDups(C{i});
    revB = [revB del_Dups];
    length_vec = [length_vec length(del_Dups)];
end;

% Creates an index vector in order to sort in loop
[del_Dups len_index] = sort(length_vec);

% Loop reverses the order of string array
for j = 1:3 
   B = [revB(len_index(j)) B];
end

