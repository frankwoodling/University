%%%%Implement newton method to minimize f(x)=7x -log(x)
function x_k=newton_1(x_0,tol,maxIter)
    x_k=x_0;
    if (x_0 <0)
        display('Starting point is not domain of function.');
    else
       
        for iter=1:maxIter
            %%%Evaluate function value, gradient, and Hessian
            fun_val=7*x_k -log(x_k);
            grad=7 - 1/x_k; H=1 /x_k^2;
            d_k=x_k - 7*x_k^2;
            %%%%%Stopping condition
            if (norm(grad) < tol)
                break;
            end
            %%%Print output
            output_string=strcat('iteration:',num2str(iter),' function value:',num2str(fun_val),' current estimate:',num2str(x_k));
            disp(output_string);
            %%%%%%%%%Update new point.
            %%%%Steplength for Newton's method
            alpha=1;
            x_k=x_k + alpha*d_k;
        end
    end
    
end