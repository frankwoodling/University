
% Course: STAT 5630
% Instructor: Minh Pham

% Homework number: 3
% Author(s): Xin Jin(xj4e), Frank Woodling(fsw5vb)

% Pledge: On our honor as a student, we have neither given nor 
% received aid on this assignment outside of the guidelines.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 1:
load('problem_1.mat')
[final_model,final_predictor]=best_set(X_train, y_train,X_val,y_val)

% Answer:

% final_model = 
% 
% 
% Linear regression model:
%     y ~ x1 + x2 + x3
% 
% Estimated Coefficients:
%           Estimate       SE        tStat       pValue  
%           ________    ________    _______    __________
% 
%     x1    0.96327     0.099679     9.6638    7.1367e-16
%     x2     2.6235      0.10483     25.026    4.1674e-44
%     x3    -4.0906      0.11144    -36.706    1.0873e-58
% 
% 
% Number of observations: 100, Error degrees of freedom: 97
% Root Mean Squared Error: 1.02
% 
% final_predictor =
% 
%      1     3     7


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 2:

% Answer is in boston_housing.m file. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

