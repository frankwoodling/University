function [w, b] = SVM_noint(X, y, C)
% Solve the dual SVM problem

w = 0;
b = 0;

% how to find alpha_i?
for i = 1:length(X)
    w = w + X(i)*y(i)*a(i);
end

for k = 1:length(X)
   if C > a(k) && a(k) < 0
       b = b + y(k) - w.*X(k);
   end
end
end

