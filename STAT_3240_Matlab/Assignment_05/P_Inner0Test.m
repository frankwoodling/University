
%%
disp('test1')
a=3;
b=5;
n=10;
tol=1e-3;
P_correct=25.1079;
x_correct = [3.0000    2.4271    0.9271   -0.9271   -2.4271   -3.0000   -2.4271   -0.9271    0.9271    2.4271    3.0000];
y_correct = [0    2.9389    4.7553    4.7553    2.9389    0.0000   -2.9389   -4.7553   -4.7553   -2.9389   -0.0000 ];
[P, x, y] = P_inner0(a,b,n);
assert(abs(P-P_correct)< tol && max(abs(x-x_correct))< tol && max(abs(y-y_correct))< tol, ...
    [ '\nYour output  \n P = ' sprintf(' %d', P) '\n x = [' sprintf(' %d ',x) ']\n'  'y = [' sprintf(' %d ',y) ']\n' ...
      'Expected output \n P = ' sprintf(' %d', P_correct) '\n x = [' sprintf(' %d ',x_correct) ']\n'  'y = [' sprintf(' %d ',y_correct) ']\n' ], ...
      P, x,y,P_correct,x_correct,y_correct);
%%
disp('test2')
a=3;
b=5;
n=7;
tol=1e-3;
P_correct=24.6787;
x_correct = [3.0000    1.8705   -0.6676   -2.7029   -2.7029   -0.6676    1.8705    3.0000];
y_correct = [0    3.9092    4.8746    2.1694   -2.1694   -4.8746   -3.9092   -0.0000 ];
[P, x, y] = P_inner0(a,b,n);
assert(abs(P-P_correct)< tol && max(abs(x-x_correct))< tol && max(abs(y-y_correct))< tol, ...
    [ '\nYour output  \n P = ' sprintf(' %d', P) '\n x = [' sprintf(' %d ',x) ']\n'  'y = [' sprintf(' %d ',y) ']\n' ...
      'Expected output \n P = ' sprintf(' %d', P_correct) '\n x = [' sprintf(' %d ',x_correct) ']\n'  'y = [' sprintf(' %d ',y_correct) ']\n' ], ...
      P, x,y,P_correct,x_correct,y_correct);
%%
disp('test2')
a=5;
b=4;
n=8;
tol=1e-3;
P_correct=27.6386;
x_correct = [5.0000    3.5355    0.0000   -3.5355   -5.0000   -3.5355   -0.0000    3.5355    5.0000];
y_correct = [0    2.8284    4.0000    2.8284    0.0000   -2.8284   -4.0000   -2.8284   -0.0000 ];
[P, x, y] = P_inner0(a,b,n);
assert(abs(P-P_correct)< tol && max(abs(x-x_correct))< tol && max(abs(y-y_correct))< tol, ...
    [ '\nYour output  \n P = ' sprintf(' %d', P) '\n x = [' sprintf(' %d ',x) ']\n'  'y = [' sprintf(' %d ',y) ']\n' ...
      'Expected output \n P = ' sprintf(' %d', P_correct) '\n x = [' sprintf(' %d ',x_correct) ']\n'  'y = [' sprintf(' %d ',y_correct) ']\n' ], ...
      P, x,y,P_correct,x_correct,y_correct);