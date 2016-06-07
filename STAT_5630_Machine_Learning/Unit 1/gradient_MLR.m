%%%Use gradient method to solve MLR least square
function beta=gradient_MLR(X,y)
[n,p]=size(X);
beta_k=zeros(p,1);
maxIter=1000;tol=1e-6;
for iter=1:maxIter
    %%%Evaluate function value, gradient, and Hessian
    fun_val=0.5*norm(y-X*beta_k)^2;
    grad=X'*X*beta_k - X'*y;
    d_k=-grad;
    %%%%%Stopping condition
    if (norm(grad) < tol)
        break;
    end
    %%Step length%%%%%%%%%%%%%%%%%%%%%%%%%%
    alpha=1e-2;
    output_string=strcat('iteration:',num2str(iter),' function value:',num2str(fun_val));
    disp(output_string);
    beta_k=beta_k +alpha*d_k;
end
end