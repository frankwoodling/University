function [P_out] = ellipsePerim3(a, b, tol, plotsOn)
n = 3;
p_n_1 = P_inner3(a,b,n);
error = 10E6;

while error > tol
    n = n+1;
    p_n = p_n_1;
    p_n_1 = P_inner3(a,b,n);
    error = (abs(p_n_1-p_n))/p_n_1;
end

%[P_out,~,~] = P_inner1(n+1);
% disp(n);
% 
[P_out, xk, yk] = P_inner3(a,b,n+1);
end


function [P, xk, yk] = P_inner3(a,b,n)

a_x = linspace(1,n,n);
xk = cos((2*pi/n)*a_x)*a;
b_x = a_x;
yk = sin((2*pi/n)*b_x)*b;

P = sum(sqrt((xk(1:n-1)-xk(2:n)).^2+(yk(1:n-1)-yk(2:n)).^2));


end