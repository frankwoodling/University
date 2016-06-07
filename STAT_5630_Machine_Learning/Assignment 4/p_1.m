%function [ output_args ] = Untitled( input_args )


for i = 1:length(y)
    if y(i) == 3
        y(i) = 1;
    else 
        y(i) = 2;
    end
end

index = crossvalind('Kfold', size(y,1), 3);
X_train = [];
y_train = [];
X_val = [];
y_val = [];
X_test = [];
y_test = [];


for i = 1:length(index)
   if index(i) == 1
       X_train = [X_train; X(i)];
       y_train = [y_train; y(i)];
   elseif index(i) == 2
       X_val = [X_val; X(i)];
       y_val = [y_val; y(i)];
   else
       X_test = [X_test; X(i)];
       y_test = [y_test; y(i)];       
   end
end

save('test_Problem1_data.mat','X_train','y_train','X_val','y_val','X_test','y_test')

fit_train = mnrfit(X_train, y_train);
plot(fit_train);

t1 = glmval(fit_train, X_test, 'logit');
glmval(fit_train, X_val, 'logit')

sum(t1 <= .5)
180/400



