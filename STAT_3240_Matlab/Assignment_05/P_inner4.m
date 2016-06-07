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