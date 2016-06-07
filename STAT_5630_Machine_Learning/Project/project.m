%% Set directories for the main project folder, training positive folder,
% and training negative folder respectively
main_dir = 'C:\Users\Frank\Desktop\STAT 5630\Project';
pos_dir = 'C:\Users\Frank\Desktop\STAT 5630\Project\train\pos';
neg_dir = 'C:\Users\Frank\Desktop\STAT 5630\Project\train\neg';

file_pos = dir(pos_dir);
file_neg = dir(neg_dir);

% Initialize empty lists and variables
word_list_pos = [];
word_list_neg = [];

% Loop will create a cell array off all postive words in n text files.
cd(pos_dir)

for i = 3:10002 % to do all use 3:length(file_pos)  3:n
   word_list_pos = [word_list_pos; textread(file_pos(i).name, '%s')];
   if mod(i,100) == 0
       disp(['Positive file #: ' num2str(i)])
   end
end

% Loop will take the cell array of positive words, remove punctation and lower case each word
% in the word list.  It will then tabulate the data to find the frequency
% of each word.

for i = 1:length(word_list_pos)
    w = word_list_pos(i);
    w_char =  char(w);
    w_rem_punct = w_char(isletter(char(w_char)));
    word_list_pos(i) = cellstr(w_rem_punct);
    disp(i)
end

word_list_pos = lower(word_list_pos);
word_list_pos = tabulate(word_list_pos);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Loop will create a cell array off all negative words in n text files.
cd(neg_dir)
for i = 3:10002 % to do all use 3:length(file_neg)
   word_list_neg = [word_list_neg; textread(file_neg(i).name, '%s')];
   if mod(i,100) == 0
       disp(['Negative file #: ' num2str(i)])
   end
end

% Loop will take the cell array of negative words, remove punctation and lower case each word
% in the word list.  It will then tabulate the data to find the frequency
% of each word.
for i = 1:length(word_list_neg)
    w = word_list_neg(i);
    w_char =  char(w);
    w_rem_punct = w_char(isletter(char(w_char)));
    word_list_neg(i) = cellstr(w_rem_punct);
    disp(i)
end

word_list_neg = lower(word_list_neg);
word_list_neg = tabulate(word_list_neg);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Formats and adds the positive and negative words to an array, and titles
% the columns.
word_list_pos = cell2table(word_list_pos);
word_list_pos.Properties.VariableNames = {'Word' 'Frequency_pos' 'Percent_pos'};
word_list_neg = cell2table(word_list_neg);
word_list_neg.Properties.VariableNames = {'Word' 'Frequency_neg' 'Percent_neg'};

word_list = outerjoin(word_list_pos, word_list_neg, 'MergeKeys', true);
vars = {'Frequency_pos' 'Percent_pos' 'Frequency_neg' 'Percent_neg'};
t = word_list{:, vars};
t(isnan(t)) = 0;
word_list{:, vars} = t;

% Adds a column of ratio values to the existing array
ratio_cell = cell(size(word_list,1),1);
for i = 1:size(word_list,1)
    if table2array(word_list(i,5)) == 0 
        ratio_cell{i} = 0;
    else
        ratio_cell{i} = table2array(word_list(i,3)) / table2array(word_list(i,5));
    end
    disp(i)
end

%%
% Prepares a list of features using specified constraints.  For example we
% only want words with a postive to negative ratio greater than 1.5 or less
% than 0.5.
feature_cell = {};
for i = 1: size(word_list,1)
    if (ratio_cell{i} >= 1.5 | ratio_cell{i} <= 0.5) & word_list{i,2}>=3 & word_list{i,4} >=3
        feature_cell = [feature_cell; word_list{i,1}];
    end
    disp(i)
end

training_pos = cell(10000,1);
cd(pos_dir)
for i = 3:10002
    training_pos{i-2} = textread(file_pos(i).name, '%s');
    disp(i)
end

for i = 1:10000
    for j = 1:length(training_pos{i})
        w = training_pos{i}{j};
        w_char =  char(w);
        w_rem_punct = w_char(isletter(char(w_char)));
        training_pos{i}{j} = lower(cellstr(w_rem_punct));
        fprintf('%d,%d\n',i,j)
    end
end

test_pos = cell(2500,1);
cd(pos_dir)
for i = 1:2500
    test_pos{i} = textread(file_pos(i+10002).name, '%s');
    disp(i)
end
for i = 1:2500
    for j = 1:length(test_pos{i})
        w = test_pos{i}{j};
        w_char =  char(w);
        w_rem_punct = w_char(isletter(char(w_char)));
        test_pos{i}{j} = lower(cellstr(w_rem_punct));
        fprintf('%d,%d\n',i,j)
    end
end

training_neg = cell(10000,1);
cd(neg_dir)
for i = 3:10002
    training_neg{i-2} = textread(file_neg(i).name, '%s');
    disp(i)
end
for i = 1:10000
    for j = 1:length(training_neg{i})
        w = training_neg{i}{j};
        w_char =  char(w);
        w_rem_punct = w_char(isletter(char(w_char)));
        training_neg{i}{j} = lower(cellstr(w_rem_punct));
        fprintf('%d,%d\n',i,j)
    end
end

test_neg = cell(2500,1);
cd(neg_dir)
for i = 1:2500
    test_neg{i} = textread(file_neg(i+10002).name, '%s');
    disp(i)
end
for i = 1:2500
    for j = 1:length(test_neg{i})
        w = test_neg{i}{j};
        w_char =  char(w);
        w_rem_punct = w_char(isletter(char(w_char)));
        test_neg{i}{j} = lower(cellstr(w_rem_punct));
        fprintf('%d,%d\n',i,j)
    end
end

A = {};
for i = 1:length(training_pos{1})
    A = [A;training_pos{1}{i}];
end


for i = 1: 10000
    A = {};
    for j = 1:length(training_pos{i})
        A = [A;training_pos{i}{j}];
    end
    training_pos{i} = A;
end

for i = 1: 10000
    A = {};
    for j = 1:length(training_neg{i})
        A = [A;training_neg{i}{j}];
    end
    training_neg{i} = A;
    disp(i)
end

for i = 1: 2500
    A = {};
    for j = 1:length(test_pos{i})
        A = [A;test_pos{i}{j}];
    end
    test_pos{i} = A;
    disp(i)
end

for i = 1: 2500
    A = {};
    for j = 1:length(test_neg{i})
        A = [A;test_neg{i}{j}];
    end
    test_neg{i} = A;
    disp(i)
end

X = zeros(20000,size(feature_cell,1));

for i = 1:10000
    for j = 1:length(feature_cell)
        X(i,j) = sum(ismember(training_pos{i},feature_cell{j}));
    end
    disp(i)
end


for i = 10001:20000
    for j = 1:length(feature_cell)
        X(i,j) = sum(ismember(training_neg{i-10000},feature_cell{j}));
    end
    disp(i)
end

y = [ones(10000,1);zeros(10000,1)];

X_test = zeros(5000,size(feature_cell,1));

for i = 1:2500
    for j = 1:length(feature_cell)
        X_test(i,j) = sum(ismember(test_pos{i},feature_cell{j}));
    end
    disp(i)
end


for i = 2501:5000
    for j = 1:length(feature_cell)
        X_test(i,j) = sum(ismember(test_neg{i-2500},feature_cell{j}));
    end
    disp(i)
end

y_test = [ones(2500,1);zeros(2500,1)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SVM without interception
w = SVM_noint(X,y,ones(20000,1))

y_pred=X_test*w;

for i = 1 : 5000
    if y_pred(i,1) > 0.5
        y_class(i,1) = 1;
    else
        y_class(i,1) = 0;
    end
end
 
1 - sum(abs(y_class - y_test))/5000
% Correct prediction percent: 0.5040

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SVM
SVMmodel = fitcsvm(X,y,'KernelFunction','linear');
y_pred_SVM = predict(SVMmodel, X_test);
1 - sum(abs(double(y_pred_SVM) - 1 - y_test))/5000
% Correct prediction percent: 0.8128

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Decision Tree
BaggedTree = TreeBagger(50,X,y,'OOBPred','On')
plot(oobError(BaggedTree))
y_pred_tree = predict(BaggedTree,X_test);
1 - sum(abs(str2num(cell2mat(y_pred_tree)) - y_test))/5000
% Correct prediction percent: 0.8360

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% More Decision Trees
% This entire section runs different types of the bagging decision tree
% tests.  It adjusts to different thresholds of ratios and also changes the
% sample size.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Takes only the first 5000 of each positive and negative review.
% The word ratio threshold is slightly increased.
%% first feature cell, contains 7990 features
feature_cell_1 = {};
for i = 1: size(word_list,1)
    if (ratio_cell{i} >= 1.5 || ratio_cell{i} <= 0.5) & word_list{i,2}>=3 & word_list{i,4} >= 3
        feature_cell_1 = [feature_cell_1; word_list{i,1}];
    end
    disp(i)
end

for i = 1:5000
    for j = 1:length(feature_cell_1)
        X_1(i,j) = sum(ismember(training_pos{i},feature_cell_1{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end


for i = 10001:15000
    for j = 1:length(feature_cell_1)
        X_1(i-5000,j) = sum(ismember(training_neg{i-10000},feature_cell_1{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

X_test_1 = zeros(5000,size(feature_cell_1,1));
for i = 1:2500
    for j = 1:length(feature_cell_1)
        X_test_1(i,j) = sum(ismember(test_pos{i},feature_cell_1{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

for i = 2501:5000
    for j = 1:length(feature_cell_1)
        X_test_1(i,j) = sum(ismember(test_neg{i-2500},feature_cell_1{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

y_1 = [ones(5000,1);zeros(5000,1)];
y_test_1 = [ones(2500,1);zeros(2500,1)];

% Decision Tree: Bagging
% Correct prediction %: 0.8408
BaggedTree = TreeBagger(50,X_1,y_1,'OOBPred','On');
plot(oobError(BaggedTree))
y_pred_tree_1 = predict(BaggedTree,X_test_1);
1 - sum(abs(str2num(cell2mat(y_pred_tree_1)) - y_test_1))/5000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2nd feature cell, 2212 features
feature_cell_2 = {};
for i = 1: size(word_list,1)
    if (ratio_cell{i} >= 3 || ratio_cell{i} <= 1/3) & word_list{i,2}>=3 & word_list{i,4} >= 3
        feature_cell_2 = [feature_cell_2; word_list{i,1}];
    end
    disp(i)
end

X_2 = zeros(10000,size(feature_cell_2,1));
for i = 1:5000
    for j = 1:length(feature_cell_2)
        X_2(i,j) = sum(ismember(training_pos{i},feature_cell_2{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end


for i = 10001:15000
    for j = 1:length(feature_cell_2)
        X_2(i-5000,j) = sum(ismember(training_neg{i-10000},feature_cell_2{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

X_test_2 = zeros(5000,size(feature_cell_2,1));
for i = 1:2500
    for j = 1:length(feature_cell_2)
        X_test_2(i,j) = sum(ismember(test_pos{i},feature_cell_2{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

for i = 2501:5000
    for j = 1:length(feature_cell_2)
        X_test_2(i,j) = sum(ismember(test_neg{i-2500},feature_cell_2{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

y_2 = [ones(5000,1);zeros(5000,1)];
y_test_2 = [ones(2500,1);zeros(2500,1)];

% Decision Tree: Bagging
% Correct prediction %: 0.7936
BaggedTree = TreeBagger(50,X_2,y_2,'OOBPred','On');
plot(oobError(BaggedTree))
y_pred_tree_2 = predict(BaggedTree,X_test_2);
1 - sum(abs(str2num(cell2mat(y_pred_tree_2)) - y_test_1))/5000
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3rd feature cell contains 1543 features
feature_cell_3 = {};
for i = 1: size(word_list,1)
    if (ratio_cell{i} >= 3.5 || ratio_cell{i} <= 1/3.5) & word_list{i,2}>=3 & word_list{i,4} >= 3
        feature_cell_3 = [feature_cell_3; word_list{i,1}];
    end
    disp(i)
end

X = zeros(10000,size(feature_cell_3,1));
for i = 1:5000
    for j = 1:length(feature_cell_3)
        X_3(i,j) = sum(ismember(training_pos{i},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

for i = 10001:15000
    for j = 1:length(feature_cell_3)
        X_3(i-5000,j) = sum(ismember(training_neg{i-10000},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

X_test_3 = zeros(5000,size(feature_cell_3,1));
for i = 1:2500
    for j = 1:length(feature_cell_3)
        X_test_3(i,j) = sum(ismember(test_pos{i},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end


for i = 2501:5000
    for j = 1:length(feature_cell_3)
        X_test_3(i,j) = sum(ismember(test_neg{i-2500},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

y_3 = [ones(5000,1);zeros(5000,1)];
y_test_3 = [ones(2500,1);zeros(2500,1)];

% Decision Tree: Bagging
% Correct prediction: 0.7824
BaggedTree = TreeBagger(50,X_3,y_3,'OOBPred','On')
plot(oobError(BaggedTree))
y_pred_tree_3 = predict(BaggedTree,X_test_3);
1 - sum(abs(str2num(cell2mat(y_pred_tree_3)) - y_test_3))/5000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4th feature cell contains 1120 features
feature_cell_4 = {};
for i = 1: size(word_list,1)
    if (ratio_cell{i} >= 4 || ratio_cell{i} <= 1/4) & word_list{i,2}>=3 & word_list{i,4} >= 3
        feature_cell_4 = [feature_cell_4; word_list{i,1}];
    end
    disp(i)
end

for i = 1:5000
    for j = 1:length(feature_cell_4)
        X_4(i,j) = sum(ismember(training_pos{i},feature_cell_4{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end


for i = 10001:15000
    for j = 1:length(feature_cell_4)
        X_4(i-5000,j) = sum(ismember(training_neg{i-10000},feature_cell_4{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

X_test_4 = zeros(5000,size(feature_cell_4,1));
for i = 1:2500
    for j = 1:length(feature_cell_4)
        X_test_4(i,j) = sum(ismember(test_pos{i},feature_cell_4{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

for i = 2501:5000
    for j = 1:length(feature_cell_4)
        X_test_4(i,j) = sum(ismember(test_neg{i-2500},feature_cell_4{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

y_4 = [ones(5000,1);zeros(5000,1)];
y_test_4 = [ones(2500,1);zeros(2500,1)];

% Decision Tree: Bagging
% Correct prediction %: 0.7696
BaggedTree = TreeBagger(50,X_4,y_4,'OOBPred','On')
plot(oobError(BaggedTree))
y_pred_tree_4 = predict(BaggedTree,X_test_4);
1 - sum(abs(str2num(cell2mat(y_pred_tree_4)) - y_test_4))/5000

% Gradient Descent Logistic
gradient_descent_logistic(X_4,y_4,1)

% trying normal least squares
test = solve(X_4'*X_4)*X_4'*Y_4;

% try SVM
SVMModel = fitcsvm(X_4,y_4)

%% 5th feature cell, contains 1120 features using all samples
feature_cell_3 = {};
for i = 1: size(word_list,1)
    if (ratio_cell{i} >= 4 || ratio_cell{i} <= 1/4) & word_list{i,2}>=3 & word_list{i,4} >= 3
        feature_cell_3 = [feature_cell_3; word_list{i,1}];
    end
    disp(i)
end

for i = 1:10000
    for j = 1:length(feature_cell_3)
        X_5(i,j) = sum(ismember(training_pos{i},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end


for i = 10001:20000
    for j = 1:length(feature_cell_3)
        X_5(i,j) = sum(ismember(training_neg{i-10000},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

X_test_5 = zeros(5000,size(feature_cell_3,1));
for i = 1:2500
    for j = 1:length(feature_cell_3)
        X_test_5(i,j) = sum(ismember(test_pos{i},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

for i = 2501:5000
    for j = 1:length(feature_cell_3)
        X_test_5(i,j) = sum(ismember(test_neg{i-2500},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

y_5 = [ones(10000,1);zeros(10000,1)];
y_test_5 = [ones(2500,1);zeros(2500,1)];

% Decision Tree: Bagging
% Correct prediction %: 0.7700
BaggedTree = TreeBagger(50,X_5,y_5,'OOBPred','On')

%% 6th feature cell, contains 1543 features using all samples
feature_cell_3 = {};
for i = 1: size(word_list,1)
    if (ratio_cell{i} >= 3.5 || ratio_cell{i} <= 1/3.5) & word_list{i,2}>=3 & word_list{i,4} >= 3
        feature_cell_3 = [feature_cell_3; word_list{i,1}];
    end
    disp(i)
end

for i = 1:10000
    for j = 1:length(feature_cell_3)
        X_6(i,j) = sum(ismember(training_pos{i},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end


for i = 10001:20000
    for j = 1:length(feature_cell_3)
        X_6(i,j) = sum(ismember(training_neg{i-10000},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

X_test_6 = zeros(5000,size(feature_cell_3,1));
for i = 1:2500
    for j = 1:length(feature_cell_3)
        X_test_6(i,j) = sum(ismember(test_pos{i},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end
 
for i = 2501:5000
    for j = 1:length(feature_cell_3)
        X_test_6(i,j) = sum(ismember(test_neg{i-2500},feature_cell_3{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

y_6 = [ones(10000,1);zeros(10000,1)];
y_test_6 = [ones(2500,1);zeros(2500,1)];

% Decision Tree: Bagging
% Correct prediction %: 0.7696
BaggedTree = TreeBagger(50,X_6,y_6,'OOBPred','On')
plot(oobError(BaggedTree))
y_pred_tree_6 = predict(BaggedTree,X_test_6);
1 - sum(abs(str2num(cell2mat(y_pred_tree_6)) - y_test_6))/5000

%% 7th feature cell, contains 2212 features using all samples
feature_cell_2 = {};
for i = 1: size(word_list,1)
    if (ratio_cell{i} >= 3 || ratio_cell{i} <= 1/3) & word_list{i,2}>=3 & word_list{i,4} >= 3
        feature_cell_2 = [feature_cell_2; word_list{i,1}];
    end
    disp(i)
end

X_7 = zeros(20000,size(feature_cell_2,1));
for i = 1:10000
    for j = 1:length(feature_cell_2)
        X_7(i,j) = sum(ismember(training_pos{i},feature_cell_2{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end


for i = 10001:20000
    for j = 1:length(feature_cell_2)
        X_7(i,j) = sum(ismember(training_neg{i-10000},feature_cell_2{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

X_test_7 = zeros(5000,size(feature_cell_2,1));
for i = 1:2500
    for j = 1:length(feature_cell_2)
        X_test_7(i,j) = sum(ismember(test_pos{i},feature_cell_2{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

for i = 2501:5000
    for j = 1:length(feature_cell_2)
        X_test_7(i,j) = sum(ismember(test_neg{i-2500},feature_cell_2{j}));
    end
    if rem(i,100) == 0 
        disp(i)
    end
end

y_7 = [ones(10000,1);zeros(10000,1)];
y_test_7 = [ones(2500,1);zeros(2500,1)];

% Decision Tree: Bagging
% Correct prediction %: 0.8006
BaggedTree = TreeBagger(50,X_7,y_7,'OOBPred','On');
plot(oobError(BaggedTree))
y_pred_tree_7 = predict(BaggedTree,X_test_7);
1 - sum(abs(str2num(cell2mat(y_pred_tree_7)) - y_test_7))/5000



