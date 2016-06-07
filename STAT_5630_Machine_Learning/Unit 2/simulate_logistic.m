function [X,y]=simulate_logistic(n,p,beta)
    X=normrnd(0,1,n,p);
    p=zeros(n,1);
    for i=1:n
        p(i)=1/(1 + exp(-X(i,:)*beta));
    end
    y=binornd(1,p);
    y(y==0)=-1;
end