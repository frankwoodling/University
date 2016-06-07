beta=[1;-1;4];n=100;p=2;
X=normrnd(0,1,n,p);

score=beta(1)*X(:,1).^2+beta(2).^2-beta(3)*(X(:,1).*X(:,2));
y=zeros(n,1);
y(score >=0)=1;y(score < 0)=-1;
% index=find(abs(score) < 0.5);
% X(index,:)=[];y(index)=[];
gscatter(X(:,1),X(:,2),y,'br');
%%%%%%%%%%%%%%%%%%%%%
new_X=zeros(n,p+1);
new_X(:,1)=X(:,1).^2;new_X(:,2)=X(:,2).^2;
new_X(:,3)=X(:,1).*X(:,2);
scatter3(new_X(:,1),new_X(:,2),new_X(:,3));
cm = [1 0 0;  0 1 0];                   % Colour Definitions
C=zeros(n,3);
C(y==1,:)=repmat([1 0 0],sum(y==1),1);C(y==-1,:)=repmat([0 1 0],sum(y==-1),1);

scatter3(new_X(:,1),new_X(:,2),new_X(:,3),[],C,'filled');
