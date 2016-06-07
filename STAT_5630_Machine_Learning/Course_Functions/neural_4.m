X=normrnd(0,1,100,1);
y=2*X.^2 -2*X + normrnd(0,.1,100,1);
X=X';y=y';
net = fitnet(10);
view(net)
[net,tr] = train(net,X,y);
plotperform(tr)

%%%%%%%%%%%%%%%%%%%%%%
testX = X(:,tr.testInd);
testT = y(:,tr.testInd);

testY = net(testX);

perf = mse(net,testT,testY);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_hat=net(X);
plotregression(y,y_hat)
