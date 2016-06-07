n=50;
beta_0=2;beta_1=3;
for count=1:10
X=normrnd(0,1,n,1);
Y_hat=beta_0+beta_1*X;
Y=Y_hat + normrnd(0,1,n,1);
%%%%Calculate beta_0 and beta_1 from data
denom=0;nomi=0;
for i=1:n
    nomi=nomi + (X(i) - mean(X))*(Y(i)-mean(Y));
    denom=denom + (X(i)-mean(X))^2;
end
beta_1_hat=nomi/denom;
beta_0_hat=mean(Y) - beta_1*mean(X);
x_ax=-3:6/100:3;
y_ax_true=beta_0 + beta_1*x_ax;
y_ax_hat=beta_0_hat + beta_1_hat*x_ax;
scatter(X,Y)
hold on
plot(x_ax,y_ax_true,'b',x_ax,y_ax_hat,'r')
end