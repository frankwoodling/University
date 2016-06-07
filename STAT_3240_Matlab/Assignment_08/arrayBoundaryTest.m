%%
disp('arrayBoundaryTest1')
rng(1234);
arrayIn=randi(50,3,3);
n=1;
tol1=1e-3;
arrayOut_cor=[  39    32    39    41    39;
    40    10    40    14    40;
    39    32    39    41    39;
    14    22    14    48    14;
    39    32    39    41    39];
[arrayOut]=arrayBoundary(arrayIn,n);
assert( all(all(arrayOut_cor==arrayOut)) , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f \n',arrayOut') ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f \n',arrayOut_cor') ']\n\n' ], ...
     arrayOut,arrayOut_cor);

%%
disp('arrayBoundaryTest2')
rng(1234);
arrayIn=randi(50,5,5);
n=2;
tol1=1e-3;
arrayOut_cor=[  35    41    22    41    35     1     4     1    35;
                26    14    32    14    26    26    31    26    26;
                18    14    10    14    18    29    19    29    18;
                26    14    32    14    26    26    31    26    26;
                35    41    22    41    35     1     4     1    35;
                36    48    40    48    36    39    19    39    36;
                19    44    39    44    19    45    47    45    19;
                36    48    40    48    36    39    19    39    36;
                35    41    22    41    35     1     4     1    35];
[arrayOut]=arrayBoundary(arrayIn,n);
assert( all(all(arrayOut_cor==arrayOut)) , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f %8.3f  %8.3f %8.3f  %8.3f \n',arrayOut') ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f %8.3f  %8.3f %8.3f  %8.3f \n',arrayOut_cor') ']\n\n' ], ...
     arrayOut,arrayOut_cor);

%%
disp('arrayBoundaryTest3')
rng(1234);
arrayIn=randi(50,4,3);
n=1;
tol1=1e-3;
arrayOut_cor=[      14    32    14    44    14;
                    39    10    39    48    39;
                    14    32    14    44    14;
                    14    22    14    18    14
                    41    40    41    26    41;
                    14    22    14    18    14];
[arrayOut]=arrayBoundary(arrayIn,n);
assert( all(all(arrayOut_cor==arrayOut)) , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f  \n',arrayOut') ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f  %8.3f  \n',arrayOut_cor') ']\n\n' ], ...
     arrayOut,arrayOut_cor);
