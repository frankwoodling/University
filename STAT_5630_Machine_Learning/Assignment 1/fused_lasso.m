function [FL] = fused_lasso(x)

[x_rows, x_cols] = size(x);

sum_1 = sum(sum(abs(x)));
sum_2 = 0;

for i = 1:(length(x_rows)-1)
    for j = 1:(length(x_cols))
        sum_2 = sum_2 + abs(x(i)- x(i+1))
    end
end
end

