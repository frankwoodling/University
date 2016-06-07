function [beta, r_squared] = my_SLR(X, Y)
% Purpose of function is to perform a simple linear regression.
% Function takes two vectors of equal length as inputs, X and Y.
% Function returns beta_0 and beta_1.  The coefficient of the intercept,
% and the coefficient of predictor X, respectively.

% find the means of each set of data
x_bar = mean(X);
y_bar = mean(Y);

% find sum of squares
S_xx = sum((X-x_bar).^2);
S_xy = sum((X-x_bar).*(Y-y_bar));

% find a and b for regression equation y_hat = a + bx
% this is the the same as b0 and b1
b = S_xy/S_xx;
a = y_bar - b*x_bar;

% a is the intercept, b is the coefficient of predictor x
beta = [a;b];

% calculates R^2, SSR/SST
y_hat = a+b.*X;
SSR = sum((y_hat-y_bar).^2);
SST = sum((Y-y_bar).^2);
r_squared = SSR/SST;
end

