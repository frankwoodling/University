function [P_out] = ellipsePerim(a, b, tol, plotsOn)
% Computes the perimeter of an ellipse until the error between iterations
% is less than the given maximum error parameter tol.

n = 3;
p_n_1 = P_inner0(n);
error = 10E6;

while error > tol
    n = n+1;
    p_n = p_n_1;
    p_n_1 = P_inner0(n);
    error = (abs(p_n_1-p_n))/p_n_1;
    %rel_error(n) = error;
end

%[P_out,~,~] = P_inner0(n+1);
disp(n);

[P_out, xk, yk] = P_inner0(n);



if strcmp(plotsOn,'on')
    plot(xk,yk, '-')
    title('Computed vertices for tol=1.00e-3')
    xlabel('x')
    ylabel('y')
    %saveas(gcf,'xyVerts.pdf')
end

%plot((length(rel_error)),rel_error);

function [P, xk, yk] = P_inner0(n)
% a and b are the semiaxes of an ellipse E.
% n is a positive integer bigger than 2.
% P is the perimeter of the inner polygon whose
% vertices are on E.

% Initialize a running sum variable to zero,
% Other initializations
theta = (2*pi)/n;
innerSum = 0;

% Compute xy-coordinates of vertex k
    k=0;
    xk(k+1) = a*cos(k*theta);
    yk(k+1) = b*sin(k*theta);
for k=1:n
    % Compute xy-coordinates of vertex k
    xk1 = a*cos(k*theta);
    yk1 = b*sin(k*theta);
   
    % Add in the distance between them to 
    % the running sum 
    dk = sqrt((xk(k)-xk1)^2 + (yk(k)-yk1)^2);
    innerSum = innerSum + dk;
    
    % Save new point as old point for next iteration
    xk(k+1) = xk1;
    yk(k+1) = yk1;
end


P = innerSum;  % Compute total perimeter of polygon across
               % all four quadrants
end
end


