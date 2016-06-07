%function evaluate the objective function value and the gradient at a point
%beta
function [val,grad]=gradient_logistic(X,y,beta)
    [n,p]=size(X);
    grad=zeros(p,1);
    val=0;
    for i=1:n
        temp=y(i)*X(i,:)*beta;
        %temp=1 +exp(-y(i)*temp);
        val=val + log(1+exp(-temp));
        %grad=grad  - exp(-y(i)*X(i,:)*beta)*y(i)*X(i,:)'/temp;
        grad=grad-y(i)*X(i,:)'/(1 + exp(temp));
    end
end