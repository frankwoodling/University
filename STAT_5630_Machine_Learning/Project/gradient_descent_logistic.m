%%%Implement gradient descent method on the logistic regressio model
function [ beta] = gradient_descent_logistic( X,y,start )
tol=1e-5;maxIter=1000;
beta=start;
alpha=1e-2;
for i=1:maxIter
    [val,grad]=gradient_logistic(X,y,beta);
    norm_grad=norm(grad);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    string=strcat('iteration number:',num2str(i),' function value:',num2str(val),' gradient norm:',num2str(norm_grad));
    disp(string);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    d=-grad;
    beta=beta + alpha*d;
    
end
end