%%%Digit data set
load('digit_12.mat');
x=X(12,:);
x=reshape(x,16,16);x=x';imshow(x);
%%%%Split the data into training and testing
index=crossvalind('Kfold',size(X,1),4);
trainIndex=find(index==1);testIndex=find(index~=1);
trainDat=X(trainIndex,:);trainLabel=y(trainIndex,:);
testDat=X(testIndex,:);testLabel=y(testIndex,:);
nTrain=size(trainDat,1);nTest=size(testDat,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Lets try normal logistic regression
B=mnrfit(trainDat,trainLabel);
%%%Prediction%%%%%%%%%
% pred=glmval(B,testDat,'logit');
% testPred = ( pred > threshold ) + 1;
% acc=1-nnz(testPred-testLabel)/numel(testLabel);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Use lasso logistic regression
%%%%Change the label to 1 and 0
y(y==2)=0;
index=crossvalind('Kfold',size(X,1),4);
trainIndex=find(index==1);testIndex=find(index~=1);
trainDat=X(trainIndex,:);trainLabel=y(trainIndex,:);
testDat=X(testIndex,:);testLabel=y(testIndex,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Perform cross validation to find the best value of tuning parameter
%%lambda
%%%%%%%%%%%%%%%%%%
[B,FitInfo] = lassoglm(trainDat,trainLabel,'binomial',...
    'NumLambda',25,'CV',5);
lassoPlot(B,FitInfo,'PlotType','CV');
[B,FitInfo] = lassoglm(trainDat,trainLabel,'binomial','Lambda',FitInfo.LambdaMinDeviance);
%%%Make prediction of the test data set
pred=glmval([Fitinfo.Intercept;B],testDat,'logit');
y_pred=zeros(size(pred));
y_pred(pred > 0.5)=1;y_pred(pred <= 0.5)=0;
acc=1-nnz(y_pred-testLabel)/numel(testLabel);

%%%%%%%%%%%%%%%%%%%%%%
B_image=reshape(B,16,16);
imshow(B_image');