%%
disp('arrayBoundary1Test1')
rng(1234);
arrayIn=randi(50,3,3);
n=1;
tol1=1e-3;
arrayOut_cor=[   10.000    10.000   40.000   14.000    14.000;
  10.000    10.000   40.000   14.000    14.000;
  32.000    32.000   39.000   41.000    41.000;
  22.000    22.000   14.000   48.000    48.000;
  22.000    22.000   14.000   48.000    48.000];
[arrayOut]=arrayBoundary1(arrayIn,n);
assert( all(all(arrayOut_cor==arrayOut)) , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f \n',arrayOut') ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f \n',arrayOut_cor') ']\n\n' ], ...
     arrayOut,arrayOut_cor);

%%
disp('arrayBoundary1Test2')
rng(1234);
arrayIn=randi(50,5,5);
n=2;
tol1=1e-3;
arrayOut_cor=[   14.000    32.000   32.000   14.000    26.000   26.000    31.000   31.000    26.000;
  14.000    10.000   10.000   14.000    18.000   29.000    19.000   19.000    29.000;
  14.000    10.000   10.000   14.000    18.000   29.000    19.000   19.000    29.000;
  14.000    32.000   32.000   14.000    26.000   26.000    31.000   31.000    26.000;
  41.000    22.000   22.000   41.000    35.000    1.000     4.000    4.000     1.000;
  48.000    40.000   40.000   48.000    36.000   39.000    19.000   19.000    39.000;
  44.000    39.000   39.000   44.000    19.000   45.000    47.000   47.000    45.000;
  44.000    39.000   39.000   44.000    19.000   45.000    47.000   47.000    45.000;
  48.000    40.000   40.000   48.000    36.000   39.000    19.000   19.000    39.000];
[arrayOut]=arrayBoundary1(arrayIn,n);
assert( all(all(arrayOut_cor==arrayOut)) , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f %8.3f  %8.3f %8.3f  %8.3f \n',arrayOut') ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f %8.3f  %8.3f %8.3f  %8.3f \n',arrayOut_cor') ']\n\n' ], ...
     arrayOut,arrayOut_cor);

%%
disp('arrayBoundary1Test3')
rng(1234);
arrayIn=randi(50,4,3);
n=1;
tol1=1e-3;
arrayOut_cor=[    10.000    10.000   39.000   48.000    48.000;
  10.000    10.000   39.000   48.000    48.000;
  32.000    32.000   14.000   44.000    44.000;
  22.000    22.000   14.000   18.000    18.000;
  40.000    40.000   41.000   26.000    26.000;
  40.000    40.000   41.000   26.000    26.000];
[arrayOut]=arrayBoundary1(arrayIn,n);
assert( all(all(arrayOut_cor==arrayOut)) , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f  \n',arrayOut') ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f  \n',arrayOut_cor') ']\n\n' ], ...
     arrayOut,arrayOut_cor);
