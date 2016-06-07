function [beta,Rsqr] = my_MLR(x,y)
if size(x,1)~=size(y,1)
    error('The size is not compatible.')
    return
else
    beta = inv(x'*x)*x'*y;
    y_mean = mean(y);
    tss = sum((y-y_mean).^2);
    y_esti = x*beta;
    rss = sum((y - y_esti).^2);
    Rsqr = 1- rss/tss;
end