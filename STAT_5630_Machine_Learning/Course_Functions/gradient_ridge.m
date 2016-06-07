%%%Use gradient method to solve ridge regression with no interecept
function beta_k=gradient_ridge(X,y,lambda)
[n,p]=size(X);
beta_k=zeros(p,1);
maxIter=10000;tol=1e-5;
    fun_val=0;
for iter=1:maxIter
    %%%Evaluate function value, gradient, and Hessian
    %fun_val=0.5*norm(y-X*beta_k)^2 + lambda*norm(beta_k)^2/2;
    grad=X'*X*beta_k - X'*y + lambda*beta_k;
    d_k=-grad;
    %%%%%Stopping condition
    if (norm(grad) < tol)
        break;
    end
    %%Step length%%%%%%%%%%%%%%%%%%%%%%%%%%
    alpha=1e-3;
    output_string=strcat('iteration:',num2str(iter),' function value:',num2str(fun_val),'norm gradient:',num2str(norm(grad)));
    disp(output_string);
    beta_k=beta_k +alpha*d_k;
end
end