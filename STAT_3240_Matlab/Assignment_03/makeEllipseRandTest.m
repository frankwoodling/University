
%%
disp('test1')
theta=30;
n=10;
n_noise=2;
rng(1234);
tol=1e-3;
x_correct = [3.1556    1.9486   -0.3833   -2.3181   -3.5972   -3.1367   -0.8660    2.0445    3.2964    3.3219];
y_correct = [2.1221    2.9308    2.0530    0.2726   -1.2870   -2.1699   -2.5000   -0.9825    0.4187    2.0010];
[x, y] = makeEllipseRand(theta,n,n_noise);
assert( max(abs(x-x_correct))< tol && max(abs(y-y_correct))< tol , ...
    [ '\nYour output \n x = [' sprintf(' %d ',x) ']\n'  'y = [' sprintf(' %d ',y) ']\n' ...
      'Expected output \n x = [' sprintf(' %d ',x_correct) ']\n'  'y = [' sprintf(' %d ',y_correct) ']\n' ], ...
      x,y,x_correct,y_correct);
%%
disp('test2')
theta=30;
n=10;
n_noise=3;
rng(1234);
tol=1e-3;
x_correct = [3.1556    2.0109   -0.4455   -2.5981   -3.5972   -2.6332   -0.8660    1.5863    3.0729    3.4641];
y_correct = [2.1221    2.6454    2.3384    0.5000   -1.2870   -2.6992   -2.5000   -1.3584    0.7206    2.0000];
[x, y] = makeEllipseRand(theta,n,n_noise);
assert( max(abs(x-x_correct))< tol && max(abs(y-y_correct))< tol , ...
    [ '\nYour output \n x = [' sprintf(' %d ',x) ']\n'  'y = [' sprintf(' %d ',y) ']\n' ...
      'Expected output \n x = [' sprintf(' %d ',x_correct) ']\n'  'y = [' sprintf(' %d ',y_correct) ']\n' ], ...
      x,y,x_correct,y_correct);
%%
disp('test3')
theta=0;
n=15;
n_noise=4;
rng(1234);
tol=1e-3;
x_correct = [3.6915    3.6039    2.4940    0.8278   -0.8901   -2.4940   -3.6039   -3.7200   -3.6039   -2.4940   -0.8901    0.6665    2.4940    3.6039    4.0000];
y_correct = [0.1221    0.8678    1.5637    2.2352    1.9499    1.5637    0.8678   -0.2274   -0.8678   -1.5637   -1.9499   -1.6480   -1.5637   -0.8678   -0.0000];
[x, y] = makeEllipseRand(theta,n,n_noise);
assert( max(abs(x-x_correct))< tol && max(abs(y-y_correct))< tol , ...
    [ '\nYour output \n x = [' sprintf(' %d ',x) ']\n'  'y = [' sprintf(' %d ',y) ']\n' ...
      'Expected output \n x = [' sprintf(' %d ',x_correct) ']\n'  'y = [' sprintf(' %d ',y_correct) ']\n' ], ...
      x,y,x_correct,y_correct);
