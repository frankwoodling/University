beta=zeros(50,1);beta(1:3)=[1,2,3];
n=50;
%%%%%Generate a training data set and a validating data set
[X,y]=simulate_ridge(n,beta);
[X_validate,y_validate]=simulate_ridge(100,beta);
lm=fitlm(X,y);
%%%%Get a sequence of values for tuning parameter lambda:
lambda=-4:8/10:4;lambda=exp(lambda)
MSE=zeros(numel(lambda),1);
for i=1:numel(lambda)
    beta_lasso=gradient_lasso(X,y,lambda(i));
    MSE(i)=0.5*norm(y_validate-X_validate*beta_lasso)^2;
end