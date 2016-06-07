%%Use car mpg data set to build regression tree
load carsmall;
%%%Fit model using variables: horsepower, weight, and model_year
X=[Horsepower Weight Model_Year];
%%%Remove rows of X with missing data
[a,b]=find(isnan(X));
X(a,:)=[];MPG(a,:)=[];
[a,b]=find(isnan(MPG));
X(a,:)=[];MPG(a,:)=[];

Model_tree=fitrtree(X,MPG);
%%%View regression tree
view(Model_tree);
view(Model_tree,'mode','graph')

%%%%Lets split data into training and testing
y=MPG;
index=crossvalind('Kfold',size(X,1),3);
train_index=find(index==1 | index ==2);
test_index=find(index==3);
X_train=X(train_index,:);y_train=y(train_index,:);
X_test=X(test_index,:);y_test=y(test_index,:);
Model_tree=fitrtree(X_train,y_train);
view(Model_tree,'mode','graph')
pred_test=predict(Model_tree,X_test);
%%%%%%%%%%%%%%%%%%%%%%%%
%%%Make prediction based on subtrees.
m = max(Model_tree.PruneList);
pruneLevels = 0:2:m; % Pruning levels to consider
z = numel(pruneLevels);
Yfit = predict(Model_tree,X_test,'SubTrees',pruneLevels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scatter(X_test(:,1),y_test)
hold on
scatter(X_test(:,1),Yfit(:,2),'r');
hold on
scatter(X_test(:,1),Yfit(:,4),'green');
