function [ P ] = transitionMatrix( n )

P = rand(n,n);


for e = 1:n
 row_sum = sum(P(:,e));
 P(:,e) = P(:,e)/row_sum;

end
end