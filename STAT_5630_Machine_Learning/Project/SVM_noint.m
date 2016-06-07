function w = SVM_noint(X,y,C)
% SVM_noint takes three inputs.
% X is an n*p matrix.
% y is an n*1 column vector, which is the response.
% C is an n*1 column vector, which is a constraint vector.
%
% Output is an n*1 column vector, which is the coefficients of soft margin.
    y = diag(y);
    H = y'*X*X'*y;
    f = -ones(size(y,1),1);
    lb = zeros(size(y,1),1);
    ub = C;
    lambda = quadprog(H,f,[],[],[],[],lb,ub);
    w = X'*y*lambda;
end
