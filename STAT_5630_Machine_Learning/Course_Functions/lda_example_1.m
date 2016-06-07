mu1=[0;0];mu2=[2;-2];
p1=0.5;p2=0.5;
sigma=[1,0.1;0.1,1];
X1=mvnrnd(mu1,sigma,50);y1=ones(50,1);
X2=mvnrnd(mu2,sigma,50);y2=2*ones(50,1);
X=[X1;X2];y=[y1;y2]
gscatter(X(:,1),X(:,2),y,'br');
%%Decision boundary
a=inv(sigma)*(mu1-mu2);a0=1/2*(mu1-mu2)'*inv(sigma)*(mu1-mu2);
A=[min(X(:,1)) max(X(:,1))];
B=[(-a0-a(1)*A(1))/a(2) (-a0-a(1)*A(2))/a(2)];
hold on
line(A,B);