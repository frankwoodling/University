% Course: STAT 5630
% Instructor: Minh Pham

% Homework number: 3
% Problem: 2
% Author(s): Xin Jin, Frank Woodling

% Pledge: On our honor as a student, we have neither given nor 
% received aid on this assignment outside of the guidelines.

load('housing.mat')

% Part 1: Divide data in 3 equal parts
[n m] = size(X);
k = 3;
indices = crossvalind('Kfold', n, 3);

training_X = [];
val_X = [];
testing_X = [];
training_y = [];
val_y = [];
testing_y = [];


for i = 1:length(indices)
    if indices(i) == 1
        training_X = [training_X; X(i,:)];
        training_y = [training_y; y(i,:)];
    elseif indices(i) == 2
        val_X = [val_X; X(i,:)];
        val_y = [val_y; y(i,:)];
    else
        testing_X = [testing_X; X(i,:)];
        testing_y = [testing_y; y(i,:)];
    end   
end

length(training_X);
length(val_X);
length(testing_X);

% Part 2 & 3: Build a regression model using training data
fitlm(training_X, training_y);
% Estimated Coefficients:
%                     Estimate        SE          tStat        pValue  
%                    __________    _________    _________    __________
% 
%     (Intercept)        35.554       9.2561       3.8411    0.00017818
%     x1               -0.14566     0.041049      -3.5485    0.00051295
%     x2               0.024064     0.024976      0.96347       0.33681
%     x3              -0.099365      0.10706      -0.9281        0.3548
%     x4                0.29656       1.3039      0.22743       0.82039
%     x5                -12.692       5.9853      -2.1205      0.035555
%     x6                 3.3777        0.821       4.1141    6.2924e-05
%     x7             -0.0019179     0.021573    -0.088905       0.92927
%     x8                -1.1951      0.31678      -3.7725    0.00022951
%     x9                0.26921      0.11589       2.3231      0.021476
%     x10             -0.012068    0.0064248      -1.8784      0.062204
%     x11               -1.0293      0.23037       -4.468    1.5151e-05
%     x12              0.012486    0.0049198       2.5379      0.012138
%     x13              -0.38582     0.091775      -4.2039    4.4181e-05
% 
% 
% Number of observations: 169, Error degrees of freedom: 155
% Root Mean Squared Error: 4.31
% R-squared: 0.748,  Adjusted R-Squared 0.727
% F-statistic vs. constant model: 35.3, p-value = 9.63e-40

% With a p-value of 9.63e-40 the F test is significant. We can conclude that
% at least some predictors have a non-zero slope.


% Part 4: Perform a ridge regression
lambda=-6:12/40:6;
lambda=exp(lambda);
MSE=zeros(numel(lambda),1);

for i=1:numel(lambda)
    beta_ridge=ridge(training_y,training_X,lambda(i));
    RSS =ridge(val_y,val_X,lambda(i));
%     MSE(i)=MSE(i)+mean(norm(val_y-val_X*beta_ridge(2:end)-beta_ridge(1))^2 );
end
% [beta_lasso,fitinfo]=lasso(X_train,y_train,'Lambda',lambda(b))

beta_ridge

% Part 5: Perform a lasso regression


