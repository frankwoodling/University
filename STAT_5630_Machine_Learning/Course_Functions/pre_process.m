function [ new_X] = pre_process( X)
new_X=zeros(size(X));
[n,p]=size(X);
for i=1:p
    new_X(:,i)=(X(:,i)-min(X(:,i)))/(max(X(:,i))-min(X(:,i)));
end


end

