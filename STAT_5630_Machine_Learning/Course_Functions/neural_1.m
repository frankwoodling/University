load('digit_01.mat');
X(:,1)=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%Split the data into training and testing
% index=crossvalind('Kfold',size(X,1),4);
% trainIndex=find(index==1);testIndex=find(index~=1);
% trainDat=X(trainIndex,:);trainLabel=y(trainIndex,:);
% testDat=X(testIndex,:);testLabel=y(testIndex,:);
% nTrain=size(trainDat,1);nTest=size(testDat,1);
%%%%Display images
% Display some of the training images
clf
for i = 1:20
    subplot(4,5,i);
    x=X(i,:);
    x=reshape(x,16,16);x=x';imshow(x);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=zeros(2,size(X,1));X=X';
for i=1:numel(y)
    if (y(i)==1)
        t(:,i)=[1;0];
    else
        t(:,i)=[0;1];
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
net = patternnet([10,10]);
view(net)
[net,tr] = train(net,X,t);
nntraintool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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