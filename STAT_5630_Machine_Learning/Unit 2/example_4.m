%%Use lasso logistic regression
n=30;p=30;beta=zeros(p,1);beta(1:3)=1:3;
[X,y]=simulate_logistic(n,p,beta);
[X_test,y_test]=simulate_logistic(1000,p,beta);
lambda=4;%%%Tuning parameter
beta_lasso=gradient_logistic_lasso(X,y,lambda);
%%%%%%%%%%Make prediction%%%%%%%%%%%%%%%%%%%%%%%
score=X_test*beta_lasso;
pred=zeros(1000,1);
pred(score >=0)=1;pred(score < 0)=-1;
%%%%%%%%Compare prediction and test data
acc=1-nnz(pred-y_test)/numel(y_test);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Lets try this with normal logistic regression in matlab
y(y==-1)=2;
B=mnrfit(X,y);
plot(B)