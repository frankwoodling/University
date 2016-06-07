a=1;b=1;a+b
a=zeros(5,1);
a=ones(10,1);
X=[1,2,3;2,3,4];
X=eye(4);
a(1),a(1:3); a(3:end)
X(1,2)
X(1,:), X(:,1)
%%%%%%%%%
X'
%%%%%%%%%%%%%%%%%%%%%
dot(a,b)
norm(a), norm(a,'inf')
inv(X), det(X*X'), rank(X)