 
%%
disp('test1')
x0=-1;
tol=1e-6;
root_correct = [-1.333333];
[root]=findRoot2(x0,tol);
tol1=1e-4; % for test
assert( abs(root-root_correct) < tol1 , ...
    [ '\nYour output \n root = [' sprintf(' %d ',root) ']\n'   ...
      'Expected output \n root = [' sprintf(' %d ',root_correct) ']\n'   ], ...
      root,root_correct);
%%
disp('test2')
x0=2.5;
tol=1e-6;
root_correct = [3.000];
[root]=findRoot2(x0,tol);
tol1=1e-4;  % for test
assert( abs(root-root_correct) < tol1 , ...
    [ '\nYour output \n root = [' sprintf(' %d ',root) ']\n'   ...
      'Expected output \n root = [' sprintf(' %d ',root_correct) ']\n'   ], ...
      root,root_correct);
%%
disp('test3')
x0=1;
tol=1e-6;
root_correct = [2.632740591412851e-04];
[root]=findRoot2( x0,tol );
tol1=1e-4;  % for test
assert( abs(root-root_correct) < tol1 , ...
    [ '\nYour output \n root = [' sprintf(' %d ',root) ']\n'   ...
      'Expected output \n root = [' sprintf(' %d ',root_correct) ']\n'   ], ...
      root,root_correct);
%%
disp('test4')
x0=-0.5;
tol=1e-6;
root_correct = [-7.8477e-05];
[root]=findRoot2( x0,tol );
tol1=1e-4;  % for test
assert( abs(root-root_correct) < tol1 , ...
    [ '\nYour output \n root = [' sprintf(' %d ',root) ']\n'   ...
      'Expected output \n root = [' sprintf(' %d ',root_correct) ']\n'   ], ...
      root,root_correct);