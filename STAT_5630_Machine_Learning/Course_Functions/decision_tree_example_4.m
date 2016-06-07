creditDS = readtable('CreditRating_Historical.dat');
%%%Load data into design matrix X and response vector y
%%%Variable: Working capital, Retained Earnings, Earnings before interests
%%%and taxes, Market value of equity, Sales, Industry sector
X = [creditDS.WC_TA creditDS.RE_TA creditDS.EBIT_TA creditDS.MVE_BVTD creditDS.S_TA creditDS.Industry];
Y = ordinal(creditDS.Rating);

leaf = [1 5 10];
nTrees = 25;
color = 'bgr';
for ii = 1:length(leaf)
   % Reinitialize the random number generator, so that the
   % random samples are the same for each leaf size
   % Create a bagged decision tree for each leaf size and plot out-of-bag
   % error 'oobError'
   b = TreeBagger(nTrees,X,Y,'oobpred','on','OOBVarImp','on','cat',6,'minleaf',leaf(ii));
   plot(b.oobError,color(ii));
   hold on;
end
xlabel('Number of grown trees');
ylabel('Out-of-bag classification error');
legend({'1', '5', '10'},'Location','NorthEast');
title('Classification Error for Different Leaf Sizes');
hold off;
bar(b.OOBPermutedVarDeltaError);
