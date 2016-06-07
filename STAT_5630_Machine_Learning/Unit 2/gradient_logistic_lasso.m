%%%Use gradient method to solve lasso logistic regression with no interecept
%%%Min 1/2 |y-Xbeta|^2_2 + lambda |beta|_1
function beta_k=gradient_lasso(X,y,lambda)
[n,p]=size(X);
beta_k=zeros(p,1);
maxIter=50000;tol=1e-5;alpha=1e-2;
fun_val=0;
for iter=1:maxIter
    %%%Evaluate function value, gradient, and Hessian
    [val,grad]=gradient_logistic(X,y,beta_k);
    w=beta_k-alpha*grad;
      %%%%Soft thresholding step%%%
    new_beta=zeros(size(beta_k));
    for i=1:p
        if (w(i) > lambda*alpha)
            new_beta(i)=w(i)-lambda*alpha;
        elseif (w(i) < -lambda*alpha)
            new_beta(i)=w(i)+lambda*alpha;
        else
            new_beta(i)=0;
        end
    end
    [val,grad]=gradient_logistic(X,y,new_beta);
    new_fun_val=val + lambda*norm(new_beta,1);
    %%%%Stopping condition
    if (abs(new_fun_val-fun_val) < tol)
        break;
    end
    beta_k=new_beta;fun_val=new_fun_val;
      output_string=strcat('iteration:',num2str(iter),' function value:',num2str(fun_val),'norm gradient:',num2str(norm(grad)));
    disp(output_string);

end
end