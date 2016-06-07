% Course: STAT 5630
% Instructor: Minh Pham

% Homework number: 3
% Problem: 1
% Author(s): Xin Jin, Frank Woodling

% Pledge: On our honor as a student, we have neither given nor 
% received aid on this assignment outside of the guidelines.


% function [lin_model] = best_set(X_train, y_train, X_val, y_val)

% Loads data set of multiple predictors with a single vector of y values.
load('problem_1.mat')

% Finds the dimensions of the data set.
[n p] = size(X_train) ;

best_r_squared = 0; 
best_r_squared_model = [];

best_RSS = 1e6;
best_RSS_model = [];

for k = 1:p
% Find all possible combinations of the p predictor vectors.
combos = combnk(1:p,k);

% Find the dimensions of the combination matrix in order to index through
% each.
[length width] = size(combos);
    
% Loop will run a linear regression on each possible combination
% updating the R^2 with the best value.  It will also find the RSS, and
% update the best found RSS using the validating data.
    for j = 1:length
        
        lm = fitlm(X_train(1:n,combos(j,:)), y_train);
        lm_val = fitlm(X_val(1:n,combos(j,:)), y_val);
        
        if sum(lm_val.Residuals.Raw.^2) < best_RSS
            best_RSS = sum(lm_val.Residuals.Raw.^2);
            best_RSS_model = combos(j,:);            
        end
        
        if lm.Rsquared.Ordinary > best_r_squared
           best_r_squared = lm.Rsquared.Ordinary;
           best_model = combos(j,:);
        end
    end    
end

% Output best R^2, RSS, and their corresponding models.
best_r_squared
best_model
best_RSS
best_RSS_model

% end
