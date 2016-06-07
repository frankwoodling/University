%%%%Implement gradient method to minimize 
%%%f(x)=-log(1-x1-x2)-log(x1)-log(x2)
function x_k=gradient_2(x_0,tol,maxIter)
    x_k=x_0;
    if (x_0(1) <=0 | x_0(2) <=0 |sum(x_0) >=1 )
        display('Starting point is not domain of function.');
    else
        for iter=1:maxIter
            %%%Evaluate function value, gradient, and Hessian
            fun_val=-log(1-x_k(1)-x_k(2)) - log(x_k(1)) -log(x_k(2));
            grad=[1/(1-x_k(1) -x_k(2))-1/x_k(1);1/(1-x_k(1) -x_k(2))-1/x_k(2)];
            d_k=-grad;
            %%%%%Stopping condition
            if (norm(grad) < tol)
                break;
            end
            %%Step length%%%%%%%%%%%%%%%%%%%%%%%%%%
            alpha=1e-2;
            output_string=strcat('iteration:',num2str(iter),' function value:',num2str(fun_val),' current estimate:',num2str(x_k));
            disp(output_string);
            x_k=x_k +alpha*d_k;
        end
    end
    
end