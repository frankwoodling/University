%%%%Implement gradient method to minimize f(x)=7x -log(x)
function x_k=gradient_1(x_0,tol,maxIter)
    x_k=x_0;
    if (x_0 <0)
        display('Starting point is not domain of function.');
    else
       
        for iter=1:maxIter
            %%%Evaluate function value, gradient, and Hessian
            fun_val=7*x_k -log(x_k);
            grad=7-1/x_k;
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