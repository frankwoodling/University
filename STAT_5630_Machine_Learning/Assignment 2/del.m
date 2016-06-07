Y = y;
x = X;
% load carsmall
% tbl = table(Weight,Acceleration,MPG,'VariableNames',{'Weight','Acceleration','MPG'});	

% % lm = fitlm(tbl,'MPG~Weight+Acceleration');
% 
% 
% tbl = table(y, X1, X2, X3, 'VariableNames', {'y', 'X1', 'X2', 'X3'});
% tbl(1:5,:)
% fitlm(tbl, 'y~X1+X2+X3')

% beta_star = inv(X'*X)*X'*Y'


beta_star = inv(X'*X)*X'*Y

beta = inv(x'*x)*x'*y