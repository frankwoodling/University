load fisheriris
spec=zeros(150,1);
for i=1:150
    if (strcat(species{i},'setosa')==1)
        spec(i)=1;
    elseif (strcat(species{i},'versicolor')==1)
        spec(i)=2;
    else spec(i)=3;
    end
    
    
end
%%%Split the data into 2 parts: one for training one for testing
index=crossvalind('Kfold',size(meas,1),2);
trainIndex=find(index==1);testIndex=find(index==2);
trainDat=meas(trainIndex,:);trainLabel=spec(trainIndex,:);
testDat=meas(testIndex,:);testLabel=spec(testIndex,:);
nTrain=size(trainDat,1);nTest=size(testDat,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IrisLDA=fitcdiscr(trainDat,trainLabel);
[testPred,score]=predict(IrisLDA,testDat);
[trainPred,score]=predict(IrisLDA,trainDat);
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
IrisQDA=fitcdiscr(trainDat,trainLabel,'DiscrimType','quadratic');
[testPred,score]=predict(IrisQDA,testDat);
[trainPred,score]=predict(IrisQDA,trainDat);
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