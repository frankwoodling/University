function [arrayOut]=arrayBoundary(arrayIn,n)
% Purpose of function is to take a data array, add n padding, and reflect 
% the original array into the new widened array.

% Determines the number of rows and columns of the orginal array.
[in_row_n,in_col_n] = size(arrayIn);

% Prepopulates an array that includes the original array in the center
% surrounded by n rows and columns of zeros.
zeroRows = zeros(n,in_col_n);
zeroCols = zeros(length(arrayIn)+n*2,n);
arrayOut = [zeroRows;arrayIn;zeroRows];
arrayOut = [zeroCols arrayOut zeroCols];

% Determines the number of rows and columns of the orginal array
[out_row_n, out_col_n] = size(arrayOut);

% For each side of the new array the function will copy and insert a
% reflection of the original array. 
arrayOut(:,1:n)=arrayOut(:,(n+1+n):-1:(n+2)); % Left side
arrayOut(:,out_col_n-n+1:out_col_n)=arrayOut(:,out_col_n-n-1:-1:out_col_n-n-n); % Right side
arrayOut(1:n,:)=arrayOut(n+n+1:-1:n+2,:); % Top side
arrayOut(out_row_n-n+1:out_row_n,:)=arrayOut(out_row_n-n-1:-1:out_row_n-n-n,:); % Bottom side

end