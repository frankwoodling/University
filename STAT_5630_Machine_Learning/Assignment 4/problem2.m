y(y == 3,:) = 1;
y(y == 8,:) = 0;
y = nominal(y);

%  Create training, validation and test dataset
index = crossvalind('Kfold', size(y,1), 3);
X_train = X(index==1, :);
X_val = X(index==2, :);
X_test = X(index==3, :);
y_train = y(index==1, :);
y_val = y(index==2, :);
y_test = y(index==3, :);

save('XinJ_FrankW_Problem2_data.mat','X_train','y_train','X_val','y_val','X_test','y_test');

[B, FitInfo] = lassoglm(X_train, y_train,'binomial','NumLambda', 30, 'CV', 5);
% Lambda = 0.0021
[B,FitInfo] = lassoglm(X_train,y_train,'binomial','Lambda',FitInfo.LambdaMinDeviance);

pred_val=glmval([FitInfo.Intercept;B],X_val,'logit');
pred_test=glmval([FitInfo.Intercept;B],X_test,'logit');
result_val = (pred_val<=0.5);
result_test = (pred_test<=0.5);
y_val = double(y_val);
y_val(y_val==2,:) = 0;
y_test = double(y_test);
y_test(y_test==2,:) = 0;
accuracy_val = 1 - nnz(result_val - y_val)/size(y_val,1)
accuracy_test = 1 - nnz(result_test - y_test)/size(y_test,1)

% accuracy_val = 0.9775
% accuracy_test = 0.9700
% The accuracy is improved compared to oridinary logistic regression.