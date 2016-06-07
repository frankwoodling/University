function [quad, grad] = my_quadratic(Q, b, x)

[q_row, q_col] = size(Q);
[x_row, x_col] = size(x);
[b_row, b_col] = size(b);

if q_row ~= x_col || q_row ~= b_col
    display('These matrices cannot be multiplied.')
else
    grad = gradient(Q)*x;
    quad = Q*x;
    
    % test for convexity
    eig_quad = eig(quad);
    for i = 1:(length(eig_quad)-1)
        if eig_quad(i) > 0 && eig_quad(i+1) < 0 ||  eig_quad(i) < 0 && eig_quad(i+1) > 0
            display('Function is convex')
    end
end
end
   