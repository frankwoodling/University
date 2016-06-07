function [B, r_squared] = my_MLR(X, Y)
% Purpose of function is to perform a multiple linear regression.
% Function takes a response variable y, and a matrix of predictors
% in x.  The function also assumes that the first column of x is 
% composed of 1s.  
% Function returns beta, a vector of least square coefficient estimates.
% It also returns an R^2 value.

% Formula used is B* = ((X^T)*(X)^-1)*(X^T)*Y

beta_star = inv(X'*X)*X'*Y;


% beta = inv(x'*x)*x'*y;
% y_mean = mean(y);
% tss = sum((y-y_mean).^2);
% y_esti = x*beta;
% rss = sum((y - y_esti).^2)
% Rsqr = 1- rss/tss


end

