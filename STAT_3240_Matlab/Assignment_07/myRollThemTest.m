
%%
disp('test1')
rng(1234);
pattern1Prob=0.4444;
ntrials=10000;
pattern1 = @(combo) (combo(1)==combo(2))|| (combo(1)==combo(3)) || (combo(2)==combo(3));
plotsOn='no';
[ntrialMatch, ntrialVec ]=rollThem(ntrials,pattern1,plotsOn);
tol1=2e-2;
assert( max(abs(ntrialMatch(end-5:end)-pattern1Prob))< tol1 ,  ...
    [ '\nYour output \npattern1Prob = [' sprintf(' %5.3f ',ntrialMatch(end-5:end)) ']\n' ...
        'Expected output \npattern1Prob = [' sprintf(' %5.3f ',pattern1Prob) ']\n'], ...
         ntrialMatch(end-5:end),pattern1Prob);
%%
disp('test2')
rng(1234);
pattern2Prob= 0.1852;
ntrials=10000;
pattern2 = @(combo) (combo(3) < combo(1) && combo(3) > combo(2)) || (combo(3) < combo(2) && combo(3) > combo(1));
plotsOn='no';
[ntrialMatch, ntrialVec ]=rollThem(ntrials,pattern2,plotsOn);
tol1=2e-2;
assert( max(abs(ntrialMatch(end-5:end)-pattern2Prob))< tol1 ,  ...
    [ '\nYour output \npattern2Prob = [' sprintf(' %5.3f ',ntrialMatch(end-5:end)) ']\n' ...
        'Expected output \npattern2Prob = [' sprintf(' %5.3f ',pattern2Prob) ']\n'], ...
         ntrialMatch(end-5:end),pattern2Prob);
%%
disp('test3')
rng(1234);
pattern3Prob=0.8148;
ntrials=10000;
pattern3 =@(combo) (combo(3) >= combo(1) && combo(3) >= combo(2)) || (combo(3) <= combo(1) && combo(3) <= combo(2));
plotsOn='no';
[ntrialMatch, ntrialVec ]=rollThem(ntrials,pattern3,plotsOn);
tol1=2e-2;
assert( max(abs(ntrialMatch(end-5:end)-pattern3Prob))< tol1 ,  ...
    [ '\nYour output \npattern3Prob = [' sprintf(' %5.3f ',ntrialMatch(end-5:end)) ']\n' ...
        'Expected output \npattern3Prob = [' sprintf(' %5.3f ',pattern3Prob) ']\n'], ...
         ntrialMatch(end-5:end),pattern3Prob);

     