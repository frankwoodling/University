y(y == 3,:) = 1;
y(y == 8,:) = 2;
y = nominal(y);

%  Create training, validation and test dataset
index = crossvalind('Kfold', size(y,1), 3);
X_train = X(index==1, :);
X_val = X(index==2, :);
X_test = X(index==3, :);
y_train = y(index==1, :);
y_val = y(index==2, :);
y_test = y(index==3, :);

save('XinJ_FrankW_Problem1_data.mat','X_train','y_train','X_val','y_val','X_test','y_test');

logistic_model = mnrfit(X_train, y_train);
plot(logistic_model)
% The majority of the predictors are 0, and only few of them
% are significant.

% pred_val = glmval(logistic_model, X_val, 'logit');
% pred_test = glmval(logistic_model, X_test, 'logit');
% result_val = (pred_val<=0.5)+1;
% result_test = (pred_test<=0.5)+1;
% accuracy_val = 1 - nnz(result_val-double(y_val))/size(y_val,1)
% accuracy_test = 1 - nnz(result_test-double(y_test))/size(y_test,1)
% % accuracy_val = 0.8875
% % accuracy_test = 0.9175