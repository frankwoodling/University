%%Build random forest on heart data set
%Build bagging trees on heart data set
load('heart.mat');
%%%Split the data to training and testing
index=crossvalind('Kfold',size(dat,1),3);
train_index=find(index==1 | index ==2);
test_index=find(index==3);
X_train=dat(train_index,:);y_train=label(train_index,:);
X_test=dat(test_index,:);y_test=label(test_index,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
leaf=[1 5 10]
nTrees=50;
color = 'bgr';
for ii = 1:length(leaf)
   % Reinitialize the random number generator, so that the
   % random samples are the same for each leaf size
   % Create a bagged decision tree for each leaf size and plot out-of-bag
   % error 'oobError'
   b = TreeBagger(nTrees,X_train,y_train,'oobpred','on','OOBVarImp','on','cat',6,'minleaf',leaf(ii),'NVarToSample',3);
   plot(b.oobError,color(ii));
   hold on;
end
xlabel('Number of grown trees');
ylabel('Out-of-bag classification error');
legend({'1', '5', '10'},'Location','NorthEast');
title('Classification Error for Different Leaf Sizes');
hold off;
bar(b.OOBPermutedVarDeltaError);
%%%%%%%%%%%Prediction%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = TreeBagger(nTrees,X_train,y_train,'oobpred','on','OOBVarImp','on','cat',6,'minleaf',leaf(3),'NVarToSample',3);

[predClass,classifScore] = b.predict(X_test);
predClass=cell2mat(predClass);predClass=str2num(predClass);
nTest=numel(y_test);
nTestCorrect=nTest-nnz(predClass-y_test);
fprintf( 1, 'correct predictions on test set :   %d / %d,  %5.2f%%\n', ...
    nTestCorrect, nTest, 100 * nTestCorrect / nTest);
[ mat, order ] = confusionmat( y_test, predClass);
disp( ' ' );
disp( order' );
disp( mat );