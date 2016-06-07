function [] = perimPerform(ellipsePerim) 

a = 5;
b = 3;
clc
disp('     tol             Perimeter')
disp('-----------------------------------')

for tol = logspace(-1, -12, 12)
    P = P_ave(tol);
    fprintf('%6.2e   %18.12f\n',tol,P)
end

function [P] = P_ave(tol)

n = ceil(sqrt(2.5/tol));
Inner = P_inner(a,b,n);
Outer = P_outer(a,b,n);
P = (Inner + Outer)/2;
    
end    
end