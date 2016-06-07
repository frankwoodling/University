%%
disp('countCharTest1')
A='123 cfbh x 4x 22Z';
c='2';
n_cor=3;
[n]=countChar(c,A);
assert( n==n_cor  , ...
    [ '\nYour output \nn = [' sprintf(' %d ',n)  ']\n\n' ...
      'Expected output \nn_cor = [' sprintf(' %d ',n_cor)  ']\n' ], ...
      n,n_cor);
%%
disp('countCharTest2')
A='12x3 cfbh x x4x 22Z';
c='x';
n_cor=4;
[n]=countChar(c,A);
assert( n==n_cor  , ...
    [ '\nYour output \nn = [' sprintf(' %d ',n)  ']\n\n' ...
      'Expected output \nn_cor = [' sprintf(' %d ',n_cor)  ']\n' ], ...
      n,n_cor);
%%
disp('countCharTest3')
A='fF 46fghb Fffff';
c='f';
n_cor=6;
[n]=countChar(c,A);
assert( n==n_cor  , ...
    [ '\nYour output \nn = [' sprintf(' %d ',n)  ']\n\n' ...
      'Expected output \nn_cor = [' sprintf(' %d ',n_cor)  ']\n' ], ...
      n,n_cor);
%%
disp('countCharTest4')
A='fF 46fghb Fffff';
c='z';
n_cor=0;
[n]=countChar(c,A);
assert( n==n_cor  , ...
    [ '\nYour output \nn = [' sprintf(' %d ',n)  ']\n\n' ...
      'Expected output \nn_cor = [' sprintf(' %d ',n_cor)  ']\n' ], ...
      n,n_cor);  