beta=[1;2];n=50;p=2;
X=normrnd(0,1,n,p);b=-0.5;
score=b+X*beta+normrnd(0,2,[n,1]);
y=zeros(n,1);
y(score >=0)=1;y(score < 0)=-1;
gscatter(X(:,1),X(:,2),y,'br');
C=2;
[w,b]=svm_nonseparable(X,y,C);
A=[min(X(:,1)) max(X(:,1))];
B=[(-b-w(1)*min(X(:,1)))/w(2) (-b-w(1)*max(X(:,1)))/w(2)];
hold on
line(A,B);
