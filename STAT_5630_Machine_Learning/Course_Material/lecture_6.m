%%%%%Generate training data and validating data
beta=ones(50,1);
n=30;
[X,y]=simulate_ridge(n,beta);
[X_test,y_test]=simulate_ridge(2*n,beta);
lambda=-4:8/5:4;lambda=exp(lambda);
MSE=zeros(numel(lambda),1);
for i=1:numel(lambda)
    beta_ridge=gradient_ridge(X,y,lambda(i));
    MSE(i)=norm(y_test-X_test*beta_ridge);
end
