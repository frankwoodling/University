load('heart.mat');
%%%Split the data into 2 parts: one for training one for testing
index=crossvalind('Kfold',size(dat,1),2);
trainIndex=find(index==1);testIndex=find(index==2);
trainDat=dat(trainIndex,:);trainLabel=label(trainIndex,:);
testDat=dat(testIndex,:);testLabel=label(testIndex,:);
nTrain=size(trainDat,1);nTest=size(testDat,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
HeartLDA=fitcdiscr(trainDat,trainLabel);
[testPred,score]=predict(HeartLDA,testDat);
[trainPred,score]=predict(HeartLDA,trainDat);
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
HeartQDA=fitcdiscr(trainDat,trainLabel,'DiscrimType','quadratic');
[testPred,score]=predict(HeartQDA,testDat);
[trainPred,score]=predict(HeartQDA,trainDat);
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