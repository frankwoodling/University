function [ w,b] = svm_l1( X,y,C)
[n,p]=size(X);
no_var=n+1+p+p;
no_cons=n+p+p;
f=zeros(no_var,1);
f(1:n)=1;
f(n+1+p+1:end)=C;
A1=zeros(n,no_var);b1=-ones(n,1);
for i=1:n
    temp=zeros(1,no_var);
    temp(1,i)=-1;
    temp(1,n+1:n+1+p)=[-y(i),-y(i)*X(i,:)];
    A1(i,:)=temp;
end
%%%%%%%%%%%%%%%%%
A2=zeros(p,no_var);b2=zeros(p,1);
A2(:,n+1+1:n+1+p)=eye(p);
A2(:,n+1+p+1:n+1+p+p)=-eye(p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A3=zeros(p,no_var);b3=zeros(p,1);
A3(:,n+1+1:n+1+p)=-eye(p);
A3(:,n+1+p+1:n+1+p+p)=-eye(p);
A=[A1;A2;A3];b=[b1;b2;b3];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lb=-inf(no_var,1);
lb(1:n)=0;lb(n+1+p+1:no_var)=0;
x=linprog(f,A,b,[],[],lb);
w=x(n+1:n+1+p);b=w(1);w=w(2:end);
end

