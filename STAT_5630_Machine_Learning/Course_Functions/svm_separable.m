function [ w,b ] = svm_separable( X,y )
[n,p]=size(X);
w=zeros(p,1);b=0;
%%%%Set up the quadratic programming problem:
%%%Hessian matrix:
H=[eye(p),zeros(p,1);zeros(1,p),0];f=zeros(p+1,1);
%%%Set up the constraints:
A=zeros(n,p+1);b=zeros(n,1);
for i=1:n
    A(i,:)=-y(i)*[1,X(i,:)];
    b(i)=-1;
end
x=quadprog(H,f,A,b);
end

