function [P, xk, yk] = P_inner3(a,b,n)

a_x = linspace(1,n,n);
xk = cos((2*pi/n)*a_x)*a;
b_x = a_x;
yk = sin((2*pi/n)*b_x)*b;

P = sum(sqrt((xk(1:n-1)-xk(2:n)).^2+(yk(1:n-1)-yk(2:n)).^2));


end