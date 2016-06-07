function [ P,Q] = matrix_factorization( R,P,Q,K,lambda )
maxStep=10000;
alpha=0.0001;
%MATRIX_FACTORIZATION Summary of this function goes here
%   Detailed explanation goes here
Q=Q';
iter=0;
while (iter <=maxStep)
    iter=iter+1;
    for i=1:size(R,1)
        for j=1:size(R,2)
            eij=R(i,j) - dot(P(i,:),Q(:,j));
            for k=1:K
                P(i,k)=P(i,k)+alpha*(2*eij*Q(k,j)-lambda*P(i,k));
                Q(k,j)=Q(k,j)+alpha*(2*eij*P(i,k)-lambda*Q(k,j));
                
            end
        end
    end
    e=0;
    for i=1:size(R,1)
        for j=1:size(R,2)
            e=e + (R(i,j)-dot(P(i,:),Q(:,j)))^2;
            for k=1:K
                e=e+lambda/2*P(i,k)^2 + lambda/2*Q(k,j)^2;
            end
        end
    end
    if (e < 0.001)
        break;
    end
end

end

