load('heart.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=zeros(2,size(dat,1));X=dat';
for i=1:numel(label)
    if (label(i)==1)
        t(:,i)=[1;0];
    else
        t(:,i)=[0;1];
    end
end
%%%Train neural net
net = patternnet([5,5]);
view(net)
net.divideParam.trainRatio=0.8;
net.divideParam.valRatio=0.2;
net.divideParam.testRatio=0;

[net,tr] = train(net,X,t);
nntraintool
%%%%%%%%%%%%%%%%%%%
%%%Testing data
testX = X(:,tr.testInd);
testT = t(:,tr.testInd);
testY = net(testX);
testIndices = vec2ind(testY);
plotconfusion(testT,testY)
%%%%%%%%%%%%%
[c,cm] = confusion(testT,testY)
fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);