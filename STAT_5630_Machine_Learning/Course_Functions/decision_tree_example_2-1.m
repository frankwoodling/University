load('heart.mat');
%%%Split the data to training and testing
index=crossvalind('Kfold',size(dat,1),3);
train_index=find(index==1 | index ==2);
test_index=find(index==3);
X_train=dat(train_index,:);y_train=label(train_index,:);
X_test=dat(test_index,:);y_test=label(test_index,:);
%%%%%FIt a classification tree
Model=fitctree(X_train,y_train);
view(Model);
view(Model,'mode','graph');
trainPred=predict(Model,X_train);
testPred=predict(Model,X_test);

nTrainCorrect = sum( y_train == trainPred );
nTestCorrect = sum( y_test == testPred );
nTrain=numel(y_train);nTest=numel(y_test);
fprintf( 1, 'correct predictions on training set :   %d / %d,  %5.2f%%\n', ...
    nTrainCorrect, nTrain, 100 * nTrainCorrect / nTrain );
[ mat, order ] = confusionmat( y_train, trainPred );
disp( ' ' );
disp( order' );
disp( mat );

fprintf( 1, 'correct predictions on test set :   %d / %d,  %5.2f%%\n', ...
    nTestCorrect, nTest, 100 * nTestCorrect / nTest );
[ mat, order ] = confusionmat( y_test, testPred );
disp( ' ' );
disp( order' );
disp( mat );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Build bagging trees on heart data set
