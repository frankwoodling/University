X=[2.5,0.5,2.2,1.9,3.1,2.3,2.0,1.0,1.5,1.2;2.4,0.7,2.9,2.2,3.0,2.7,1.6,1.1,1.6,0.9];
scatter(X(1,:),X(2,:))
X=X';
for i=1:2
    X(:,i)=(X(:,i)-mean(X(:,i))) / std(X(:,i));
end
Sigma=X'*X/9;
[eig_vec,eig_val]=eig(Sigma);
alpha=eig_vec(:,2);
Y=X*alpha;
recover_X=Y*alpha';