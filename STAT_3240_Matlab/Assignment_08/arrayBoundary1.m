function [arrayOut]=arrayBoundary1(arrayIn,n)
% Takes an array, adds n amount of rows and columns as padding and reflects
% the original array into the padding.

arrayOut = padarray(arrayIn,[n,n], 'symmetric');

end