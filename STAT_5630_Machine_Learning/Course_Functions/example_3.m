load('digit_12.mat');
X_train=X(1:200,:);y_train=y(1:200,1);
B = mnrfit( X_train, y_train );
