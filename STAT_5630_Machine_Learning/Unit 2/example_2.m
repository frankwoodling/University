
clear all
load heart
%%%Split the data into 2 parts: one for training one for testing
index=crossvalind('Kfold',size(dat,1),2);
trainIndex=find(index==1);testIndex=find(index==2);
trainDat=dat(trainIndex,:);trainLabel=label(trainIndex,:);
testDat=dat(testIndex,:);testLabel=label(testIndex,:);
nTrain=size(trainDat,1);nTest=size(testDat,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

B = mnrfit( trainDat, trainLabel );

% output from mnrval has two columns of probabilities, one for each class
pred = mnrval( B, trainDat );

% convert probabilities in column 2 into class labels (1 and 2) by comparing to threshold
threshold = 0.5;
trainPred = ( pred( :, 2 ) > threshold ) + 1;   % have to add 1 to get class labels 1 and 2

pred = mnrval( B, testDat );
testPred = ( pred( :, 2 ) > threshold ) + 1;

nTrainCorrect = sum( trainLabel == trainPred );
nTestCorrect = sum( testLabel == testPred );
fprintf( 1, 'correct predictions on training set :   %d / %d,  %5.2f%%\n', ...
    nTrainCorrect, nTrain, 100 * nTrainCorrect / nTrain );
[ mat, order ] = confusionmat( trainLabel, trainPred );
disp( ' ' );
disp( order' );
disp( mat );
fprintf( 1, 'correct predictions on test set     :   %d / %d,  %5.2f%%\n', ...
    nTestCorrect, nTest, 100 * nTestCorrect / nTest );
[ mat, order ] = confusionmat( testLabel, testPred, 'order', order );
disp( ' ' );
disp( order' );
disp( mat );