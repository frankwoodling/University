function [P_out] = ellipsePerim4(a, b, tol, plotsOn)
n = 3;
p_n_1 = P_inner4(n,a,b);
error = 10E6;

while error > tol
    n = n+1;
    p_n = p_n_1;
    p_n_1 = P_inner4(n,a,b);
    error = (abs(p_n_1-p_n))/p_n_1;
end

[P_out,~,~] = P_inner4(n+1,a,b);
disp(n);

[P_out, xk, yk] = P_inner4(n,a,b);

end

function [P, xk, yk] = P_inner4(n,a,b)

theta = ((2*pi)/4)/n;

for k = 1:n
    a_x = linspace(1,n,n);
    xk = cos(k*(theta)*a_x)*a;
    b_x = a_x;
    yk = sin(k*(theta)*b_x)*b;

    P = sum(sqrt((xk(1:n-1)-xk(2:n)).^2+(yk(1:n-1)-yk(2:n)).^2));
end
end