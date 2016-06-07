function [ w,b ] = svm_nonseparable( X,y,C)
[n,p]=size(X);
w=zeros(p,1);b=0;
%%%%Set up the quadratic programming problem:
%%%Hessian matrix:
Y=diag(y);
H=(Y'*X)*(X'*Y);f=-ones(n,1);
%%%Set up the constraints:
A=y';b=0;
l=zeros(n,1);u=ones(n,1)*C;
lambda=quadprog(H,f,[],[],A,b,l,u);
w=X'*Y*lambda;
index=find(abs(lambda) < 1e-6);
index=index(1);
b=y(index)-dot(w',X(index,:));
end

