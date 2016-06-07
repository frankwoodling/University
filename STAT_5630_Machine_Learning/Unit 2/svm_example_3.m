load('heart.mat');
label(label==2)=-1;
%%%Split the data into 2 parts: one for training one for testing
index=crossvalind('Kfold',size(dat,1),2);
trainIndex=find(index==1);testIndex=find(index==2);
trainDat=dat(trainIndex,:);trainLabel=label(trainIndex,:);
testDat=dat(testIndex,:);testLabel=label(testIndex,:);
nTrain=size(trainDat,1);nTest=size(testDat,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%data process%%%%%%%%%%%%%%%%%%%%%
trainDat=pre_process(trainDat);
testDat=pre_process(testDat);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Linear kernel
C=1;
SVMModel = fitcsvm(trainDat,trainLabel,'BoxConstraint',C);
[testPred,score]=predict(SVMModel,testDat);
[trainPred,score]=predict(SVMModel,trainDat);

nTrainCorrect = sum( trainLabel == trainPred );
nTestCorrect = sum( testLabel == testPred );
fprintf( 1, 'correct predictions on training set :   %d / %d,  %5.2f%%\n', ...
    nTrainCorrect, nTrain, 100 * nTrainCorrect / nTrain );
[ mat, order ] = confusionmat( trainLabel, trainPred );
disp( ' ' );
disp( order' );
disp( mat );
%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf( 1, 'correct predictions on test set     :   %d / %d,  %5.2f%%\n', ...
    nTestCorrect, nTest, 100 * nTestCorrect / nTest );
[ mat, order ] = confusionmat( testLabel, testPred, 'order', order );
disp( ' ' );
disp( order' );
disp( mat );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Gaussian
C=5;
SVMModel = fitcsvm(trainDat,trainLabel,'KernelFunction','rbf','BoxConstraint',C);
[testPred,score]=predict(SVMModel,testDat);
[trainPred,score]=predict(SVMModel,trainDat);

nTrainCorrect = sum( trainLabel == trainPred );
nTestCorrect = sum( testLabel == testPred );
fprintf( 1, 'correct predictions on training set :   %d / %d,  %5.2f%%\n', ...
    nTrainCorrect, nTrain, 100 * nTrainCorrect / nTrain );
[ mat, order ] = confusionmat( trainLabel, trainPred );
disp( ' ' );
disp( order' );
disp( mat );
%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf( 1, 'correct predictions on test set     :   %d / %d,  %5.2f%%\n', ...
    nTestCorrect, nTest, 100 * nTestCorrect / nTest );
[ mat, order ] = confusionmat( testLabel, testPred, 'order', order );
disp( ' ' );
disp( order' );
disp( mat );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Polynomial
C=1;
SVMModel = fitcsvm(trainDat,trainLabel,'KernelFunction','polynomial','PolynomialOrder',2,'BoxConstraint',C);
[testPred,score]=predict(SVMModel,testDat);
[trainPred,score]=predict(SVMModel,trainDat);

nTrainCorrect = sum( trainLabel == trainPred );
nTestCorrect = sum( testLabel == testPred );
fprintf( 1, 'correct predictions on training set :   %d / %d,  %5.2f%%\n', ...
    nTrainCorrect, nTrain, 100 * nTrainCorrect / nTrain );
[ mat, order ] = confusionmat( trainLabel, trainPred );
disp( ' ' );
disp( order' );
disp( mat );
%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf( 1, 'correct predictions on test set     :   %d / %d,  %5.2f%%\n', ...
    nTestCorrect, nTest, 100 * nTestCorrect / nTest );
[ mat, order ] = confusionmat( testLabel, testPred, 'order', order );
disp( ' ' );
disp( order' );
disp( mat );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Lets try svm_l1
C=1;
[w,b]=svm_l1(trainDat,trainLabel,C);
%%%%%%%%%%Predict%%%%%%%%%%%%%%%%%%%
score=b+testDat*w;
testPred=zeros(size(score));testPred(score >=0)=1;testPred(score <0)=-1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
score=b+trainDat*w;
trainPred=zeros(size(score));trainPred(score >=0)=1;trainPred(score <0)=-1;
nTrainCorrect = sum( trainLabel == trainPred );
nTestCorrect = sum( testLabel == testPred );
fprintf( 1, 'correct predictions on training set :   %d / %d,  %5.2f%%\n', ...
    nTrainCorrect, nTrain, 100 * nTrainCorrect / nTrain );
[ mat, order ] = confusionmat( trainLabel, trainPred );
disp( ' ' );
disp( order' );
disp( mat );
%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf( 1, 'correct predictions on test set     :   %d / %d,  %5.2f%%\n', ...
    nTestCorrect, nTest, 100 * nTestCorrect / nTest );
[ mat, order ] = confusionmat( testLabel, testPred, 'order', order );
disp( ' ' );
disp( order' );
disp( mat );