%%%Generate data:
n=100;p=2;beta=[1;2];
[X,y]=simulate_logistic(n,p,beta);y(y==-1)=2;
B = mnrfit(X, y );
B
gscatter(X(:,1),X(:,2),y,'br');
hold on
seq1=min(X(:,1)):(max(X(:,1))-min(X(:,1)))/100:max(X(:,1));
seq2=-B(2)*seq1/B(3);
plot(seq1,seq2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Add columns of 1 for intercept. 
X=[ones(100,1),X];y(y==2)=-1;
gscatter(X(:,2),X(:,3),y,'br');
start=zeros(3,1);
beta=gradient_descent_logistic(X,y,start);
%%%%%Plot points and decision boundary
gscatter(X(:,2),X(:,3),y,'br');
hold on
seq1=min(X(:,2)):(max(X(:,2))-min(X(:,2)))/100:max(X(:,2));
seq2=-beta(2)*seq1/beta(3);
plot(seq1,seq2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Using matlab built in function
