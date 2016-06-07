%% Prepare data files for student
   in_f='http://www.people.virginia.edu/~teh1m/3240/trees.csv';
   out_f='./trees.csv';
   urlwrite(in_f,out_f);
%%
disp('test1')
rng(1234);
ntrials=1e5;
csvfile='trees.csv';
r=37;
plotsOn='on';
[prctBias, prctRMSE, ntrialVec]=p03RepeatedM(ntrials,csvfile,r,plotsOn);
tol1=1.0e-1;
tol2=1.0e-1;
assert( max(abs(prctBias(end-5:end)-(-0.1)))< tol1 && max(abs(prctRMSE(end-5:end)-29.75))< tol2,  ...
    [ '\nYour output (last 5 entries) \nprctBias = [' sprintf(' %5.3f ',prctBias(end-5:end)) ']\n' ...
    'prctRMSE = [' sprintf(' %5.3f ',prctRMSE(end-5:end)) ']\n' ...
        'Expected output prctBias within ' sprintf(' %5.3f ',tol1) ' of 0 \n' ...
        'Expected output prctRMSE within ' sprintf(' %5.3f ',tol2) ' of 29.75 \n'], ...
        prctBias(end-5:end),prctRMSE(end-5:end),tol1,tol2)
%%
disp('test2')
rng(1234);
ntrials=2e5;
csvfile='trees.csv';
r=27;
plotsOn='on';
[prctBias, prctRMSE, ntrialVec]=p03RepeatedM(ntrials,csvfile,r,plotsOn);
tol1=1e-1;
tol2=1e-1;
assert( max(abs(prctBias(end-5:end)-(0.1)))< tol1 && max(abs(prctRMSE(end-5:end)-35.4))< tol2,  ...
    [ '\nYour output (last 5 entries) \nprctBias = [' sprintf(' %5.3f ',prctBias(end-5:end)) ']\n' ...
    'prctRMSE = [' sprintf(' %5.3f ',prctRMSE(end-5:end)) ']\n' ...
        'Expected output prctBias within ' sprintf(' %5.3f ',tol1) ' of 0.1 \n' ...
        'Expected output prctRMSE within ' sprintf(' %5.3f ',tol2) ' of 35.4 \n'], ...
        prctBias(end-5:end),prctRMSE(end-5:end),tol1,tol2)

 
%%
disp('Performance Timing Test')
rng(1234);
ntrials=1e5;
csvfile='trees.csv';
r=37;
plotsOn='off';
tic;
[prctBias, prctRMSE, ntrialVec]=p03RepeatedM(ntrials,csvfile,r,plotsOn);
time_student=toc
tic;
[prctBias, prctRMSE, ntrialVec]=p03RepeatedMRef(ntrials,csvfile,r,plotsOn);
time_solution=toc
assert( (time_student/time_solution) < 1.2 , ...
    [ '\nYour timing \n P = [' sprintf(' %8.4f ',time_student) ']\n'   ...
      'Solution timing \n P = [' sprintf(' %8.4f ',time_solution) ']\n'   ], ...
      time_student,time_solution);
     