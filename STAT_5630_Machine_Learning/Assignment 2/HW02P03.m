rng(1234)
% create a vector x with 100 random observations with mean 0 and variance 1
x = normrnd(0,1,[1,100]);

% create a vector of noise with 100 observations with mean 0 and 
% variance 0.25
err = normrnd(0,0.25,[1,100]);

% create a vector from given model
y = -1 + 2*x + err;

% display a scatterplot to show X and Y relationship
scatter(x,y)
% There is an obvious linear relationship between X and Y.  As X increases
% Y also increases.


% x(1:5,:)
fitlm(x,y)
% Estimated Coefficients:
%                    Estimate       SE        tStat       pValue  
%                    ________    ________    _______    __________
% 
%     (Intercept)    -0.98974     0.02519    -39.291     8.669e-62
%     x1               2.0191    0.025579     78.936    1.6361e-90

% Compare select predicted values to actual values.
% We can see that the predicted values are very similar to the actual
% values from the printed table.  Most observations are off by a few
% tenths.
pred_vs_actual = [y(20) -.98974+x(20)*2.0191;
                  y(40) -.98974+x(40)*2.0191;
                  y(60) -.98974+x(60)*2.0191;
                  y(80) -.98974+x(80)*2.0191];

dataset({pred_vs_actual 'Actual','Predicted'},'obsnames', {'20','40','60', '80'})

% Looking at the R-squared value we can see that x explains 98.5% of the
% variation in y.  We can also look at the p-value of 1.6361e-90.  This
% allows us to reject the null hypothesis that there is no relationship
% between x and y.
