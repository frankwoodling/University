random_permutation = randperm(506);
training = random_permutation(1:169);
validating = random_permutation(170:2*169);
testing = random_permutation(2*169+1:506);

LG_model = fitlm(X(training,:),y(training,:));

% Linear regression model:
%     y ~ 1 + x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13
% 
% Estimated Coefficients:
%                     Estimate        SE         tStat        pValue  
%                    __________    _________    ________    __________
% 
%     (Intercept)        43.182       10.348      4.1728    4.9964e-05
%     x1              -0.029101      0.16329    -0.17822       0.85878
%     x2               0.055828      0.02544      2.1945       0.02969
%     x3               0.033866       0.1178     0.28748       0.77413
%     x4                -1.0134       1.7899    -0.56617        0.5721
%     x5                -15.103       8.8961     -1.6977      0.091577
%     x6                 3.4431      0.77798      4.4256    1.8044e-05
%     x7             0.00048896     0.025963    0.018833         0.985
%     x8                -1.5985      0.39094     -4.0888    6.9451e-05
%     x9                0.50839       0.1693      3.0029     0.0031186
%     x10             -0.021344    0.0087757     -2.4322      0.016146
%     x11               -1.1419      0.27308     -4.1817    4.8241e-05
%     x12              0.013634    0.0056456       2.415        0.0169
%     x13              -0.66482      0.09575     -6.9433    9.8872e-11
% 
% 
% Number of observations: 169, Error degrees of freedom: 155
% Root Mean Squared Error: 5.34
% R-squared: 0.714,  Adjusted R-Squared 0.69
% F-statistic vs. constant model: 29.8, p-value = 1.21e-35

% The estimated coefficients and standard error are shown above.
% From p-value, we know that x1,x3,x4,x7 are insignificant.
% The p-value of F-test is small, which means the model is significant.

lambda = -6:12/39:6;
lambda = exp(lambda);
ridge_model = ridge(y(training,:),X(training,:),lambda);
ridge_RSS = sum((X(validating,:)* ridge_model - repmat(y(validating,:),1,40)).^2)/size(X(validating,:),1);
plot(lambda, ridge_RSS)
[best_ridge_RSS, best_ridge_index] = min(ridge_RSS)
best_ridge_lambda = lambda(best_ridge_index)

% The best lambda value should be 296.5772.
% The correspoding RSS should be 11057.

lambda = -6:12/39:6;
lambda = exp(lambda);
lasso_model = lasso(X(training,:),y(training,:),'lambda', lambda);
lasso_RSS = sum((X(validating,:)* lasso_model - repmat(y(validating,:),1,40)).^2)/size(X(validating,:),1);
% plot(lambda, lasso_RSS)
[best_lasso_RSS, best_lasso_index] = min(lasso_RSS);
best_lasso_lambda = lambda(best_lasso_index);

% The best lambda value should be 2.9356.
% The correspoding RSS should be 311.0908.

% Conclusion:

mean((predict(LG_model, X(validating,:)) - y(validating,:)).^2);
% The linear regression model has the smallest test RSS. (26.1552)
% Ridge regression has the biggest test RSS.

ridge(y(training,:),X(training,:),best_ridge_lambda);
% The coefficient of each predictor is not equal to 0, which means every
% predictor is chosen.

lasso(X(training,:),y(training,:),'lambda', best_lasso_lambda);
% Lasso chose x6, x11, x13.
