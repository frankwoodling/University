%%%Generate data for training and testing with predetermined beta using the
%%%function simulate_ridge
p=50;beta=zeros(p,1);
beta(1:5)=2:6;
%%%Size of training data and testing data:
n=40;n_test=100;
[X,y]=simulate_ridge(n,beta);
[X_test,y_test]=simulate_ridge(n_test,beta);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Use crossvalind to randomly split X into 5 groups of approximately equal
%size
cross_index=crossvalind('Kfold',n,5);
%%%Cross validation, consecutively use 4 groups of the training data to fit
%ridge regression model and test the results on the one held-out group.
%%tuning parameter lambda. Usually chosen on a grid of increasing size. One
%%can choose lambda ranging from exp(-7) to exp(7). Here we choose 30
%%values of lambda. 
lambda=-7:14/30:7;lambda=exp(lambda);
MSE=zeros(numel(lambda),1);
%%Start cross validation
for fold=1:5
    %%SPlit the training data to training and validating
    train_index=find(cross_index ~= fold);
    val_index=find(cross_index == fold);
    X_train=X(train_index,:);y_train=y(train_index,:);
    X_val=X(val_index,:);y_val=y(val_index,:);
    for i=1:numel(lambda)
        %%%%Fit lasso regression for current groups and tuning parameter
        [beta_lasso,fitinfo]=lasso(X_train,y_train,'Lambda',lambda(i));
        MSE(i)=MSE(i)+mean(norm(y_val-X_val*beta_lasso-fitinfo.Intercept)^2 );
    end
end
%%%Find the value of lambda that yield lowest validation MSE. 
[a,b]=min(MSE);
[beta_lasso,fitinfo]=lasso(X_train,y_train,'Lambda',lambda(b));
%%%%Make prediction on the testing data set
test_MSE=mean(norm(y_test-X_test*beta_lasso-fitinfo.Intercept)^2);
plot(MSE)