function [X,y]=simulate(n,beta,beta_0)
p=numel(beta);
X=normrnd(0,1,n,p);
Y_hat=X*beta+beta_0;
y=Y_hat+normrnd(0,.5,n,1);
X=[ones(n,1),X];
end