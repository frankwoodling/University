beta=[1;2];n=50;p=2;
X=normrnd(0,1,n,p);
score=X*beta;
y=zeros(n,1);
y(score >=0)=1;y(score < 0)=-1;
index=find(abs(score) < 0.5);
X(index,:)=[];y(index)=[];
gscatter(X(:,1),X(:,2),y,'br');
% hold on
% A=[min(X(:,1)) max(X(:,1))];
% B=[-min(X(:,1))/2 -max(X(:,1))/2];
% line(A,B);
% 
% hold on
% A=[min(X(:,1))+0.2 max(X(:,1))+0.2];
% B=[-min(X(:,1))/2+0.2 -max(X(:,1))/2+0.2];
% line(A,B);
% hold on
% A=[min(X(:,1))-0.2 max(X(:,1))-0.2];
% B=[-min(X(:,1))/2-0.2 -max(X(:,1))/2-0.2];
% line(A,B);
% hold on
% A=[min(X(:,1))+0.3 max(X(:,1))-0.3];
% B=[-min(X(:,1))/2-0.3 -max(X(:,1))/2+0.3];
% line(A,B);
% hold on
% A=[min(X(:,1))-0.3 max(X(:,1))+0.3];
% B=[-min(X(:,1))/2+0.3 -max(X(:,1))/2-0.3];
% line(A,B);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=svm_separable(X,y);
A=[min(X(:,1)) max(X(:,1))];
B=[(-x(1)-x(2)*min(X(:,1)))/x(3) (-x(1)-x(2)*max(X(:,1)))/x(3)];
line(A,B);
