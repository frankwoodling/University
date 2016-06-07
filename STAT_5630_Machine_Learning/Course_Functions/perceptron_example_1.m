beta=[1;2];n=100;p=2;
X=normrnd(0,1,n,p);
score=X*beta;
y=zeros(n,1);
y(score >=0)=1;y(score < 0)=-1;
index=find(abs(score) < 1);
X(index,:)=[];y(index)=[];
gscatter(X(:,1),X(:,2),y,'br');
%%%%%%%%%%%%%%%%%%%%%%
w=rand(3,1);
A=[min(X(:,1)) max(X(:,1))];
B=[(-w(1)-w(2)*min(X(:,1)))/w(3) (-w(1)-w(2)*max(X(:,1)))/w(3)];
gscatter(X(:,1),X(:,2),y,'br');
hold on
line(A,B);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxIter=10000;
iter=0;
[n,p]=size(X);
v=0.001;
score=X*w(2:end)+w(1);
y_hat=zeros(size(score));y_hat((score >=0))=1;y_hat((score <0))=-1;
while (iter <= maxIter)
    iter =iter+1;

    count=0; %%%Count how many incorrectly classified
    for i=1:n
        if (y_hat(i) ~= y(i))
            count=count+1;
            w=w + [v*(y(i)-y_hat(i));v*(y(i)-y_hat(i))*X(i,:)'];
            score=X*w(2:end)+w(1);
            y_hat=zeros(size(score));y_hat((score >=0))=1;y_hat((score <0))=-1;

        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A=[min(X(:,1)) max(X(:,1))];
    B=[(-w(1)-w(2)*min(X(:,1)))/w(3) (-w(1)-w(2)*max(X(:,1)))/w(3)];
    gscatter(X(:,1),X(:,2),y,'br');
    hold on
    line(A,B,'color','gr');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (count ==0)
        A=[min(X(:,1)) max(X(:,1))];
        B=[(-w(1)-w(2)*min(X(:,1)))/w(3) (-w(1)-w(2)*max(X(:,1)))/w(3)];
        gscatter(X(:,1),X(:,2),y,'br');
        hold on
        line(A,B,'color','gr');
        break;
    end
end
