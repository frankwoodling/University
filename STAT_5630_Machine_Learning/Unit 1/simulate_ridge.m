function [X,y]=simulate_ridge(n,beta)
p=numel(beta);
X=normrnd(0,1,n,p);
Y_hat=X*beta;
y=Y_hat+normrnd(0,1,n,1);
end