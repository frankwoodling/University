
%%
disp('test1')
rng(1234);
decYes=0.666;
decNo=0.333;
decFlip=0.50;
decMaybe=0.57;
ntrials=5000;
always=@() 1;
plotsOn='no';
[ntrialWins, ntrialVec]=montyHall(ntrials,always,plotsOn);
tol1=2e-2;
assert( max(abs(ntrialWins(end-5:end)-decYes))< tol1 ,  ...
    [ '\nYour output \ndecYes = [' sprintf(' %5.3f ',ntrialWins(end-5:end)) ']\n' ...
        'Expected output \ndecYes_corr = [' sprintf(' %5.3f ',decYes) ']\n'], ...
         ntrialWins(end-5:end),decYes);
%%

disp('test2')
rng(1234);
decYes=0.333;
ntrials=5000;
never='never';
plotsOn=@() 0;
[ntrialWins, ntrialVec]=montyHall(ntrials,never,plotsOn);
tol1=2e-2;
assert( max(abs(ntrialWins(end-5:end)-decYes))< tol1 ,  ...
    [ '\nYour output \ndecYes = [' sprintf(' %5.3f ',ntrialWins(end-5:end)) ']\n' ...
        'Expected output \ndecYes_corr = [' sprintf(' %5.3f ',decYes) ']\n'], ...
         ntrialWins(end-5:end),decYes);
%%
disp('test3')
rng(1234);
decYes=0.5;
ntrials=5000;
flip=@() rand();
plotsOn='no';
[ntrialWins, ntrialVec]=montyHall(ntrials,flip,plotsOn);
tol1=2e-2;
assert( max(abs(ntrialWins(end-5:end)-decYes))< tol1 ,  ...
    [ '\nYour output \ndecYes = [' sprintf(' %5.3f ',ntrialWins(end-5:end)) ']\n' ...
        'Expected output \ndecYes_corr = [' sprintf(' %5.3f ',decYes) ']\n'], ...
         ntrialWins(end-5:end),decYes);     
%%
disp('test4')
rng(1234);
decYes=0.62;
ntrials=5000;
whyNot=@() rand(1)+1.5;
plotsOn='no';
[ntrialWins, ntrialVec]=montyHall(ntrials,whyNot,plotsOn);
tol1=2e-2;
assert( max(abs(ntrialWins(end-5:end)-decYes))< tol1 ,  ...
    [ '\nYour output \ndecYes = [' sprintf(' %5.3f ',ntrialWins(end-5:end)) ']\n' ...
        'Expected output \ndecYes_corr = [' sprintf(' %5.3f ',decYes) ']\n'], ...
         ntrialWins(end-5:end),decYes);     
     