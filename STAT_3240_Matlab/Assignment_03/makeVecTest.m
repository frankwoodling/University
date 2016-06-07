%%
disp('test1')
n=100;
tol=1e-4;
f_correct = [100    50    25    76    38    19    58    29    88    44];
[f ] = makeVec(n);
assert( max(abs(f-f_correct))< tol  , ...
    [ '\nYour output \n f = [' sprintf(' %d ',f) ']\n'  ...
      'Expected output \n x = [' sprintf(' %d ',f_correct) ']\n'  ], ...
      f,f_correct);
assert(all(f==f_correct) ,  ['Your output was f = [' sprintf(' %d ',f) ']\n'], f);
%%
disp('test2')
n=1000;
tol=1e-4;
f_correct = [1000  500  250   125   376    188    94     47    142     71];
[f ] = makeVec(n);
assert( max(abs(f-f_correct))< tol  , ...
    [ '\nYour output \n f = [' sprintf(' %d ',f) ']\n'  ...
      'Expected output \n x = [' sprintf(' %d ',f_correct) ']\n'  ], ...
      f,f_correct);
%%
disp('test3')
n=500;
f_correct = [500   250   125   376   188    94    47   142    71   214 ];
[f ] = makeVec(n);
assert( max(abs(f-f_correct))< tol  , ...
    [ '\nYour output \n f = [' sprintf(' %d ',f) ']\n'  ...
      'Expected output \n x = [' sprintf(' %d ',f_correct) ']\n'  ], ...
      f,f_correct);
%%
disp('test4')
n=10;
tol=1e-4;
f_correct = [10     5    16     8     4     2     1     4     2     1 ];
[f ] = makeVec(n);
assert( max(abs(f-f_correct))< tol  , ...
    [ '\nYour output \n f = [' sprintf(' %d ',f) ']\n'  ...
      'Expected output \n x = [' sprintf(' %d ',f_correct) ']\n'  ], ...
      f,f_correct);