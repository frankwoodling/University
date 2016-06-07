function [z] = matrix_multiply(x, y)
% Function takes two matrices and multiplies them together.
% Two input matrices must be eligible for multiplication.

x = [1 2; 3 4; 5 6];
y = [1 2 3; 4 5 6];

[x_row, x_col] = size(x);
[y_row, y_col] = size(y);

if x_row ~= y_col
    display('These two matrices cannot be multiplied.')
else
    for row = 1:x_row
    for col = 1:y_col
		mat_sum = 0;
		for i = 1:x_col
			mat_sum = mat_sum + x(row, i) * y(i, col);
		end
		z(row, col) = mat_sum;
    end
    end
end
end

