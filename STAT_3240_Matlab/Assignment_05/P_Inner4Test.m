
%%
disp('test1')
a=3;
b=5;
n=10;
tol=1e-3;
P_correct= 25.5008;
x_correct = [3.0000    2.9631    2.8532    2.6730    2.4271    2.1213    1.7634    1.3620    0.9271    0.4693    0.0000];
y_correct = [ 0    0.7822    1.5451    2.2700    2.9389    3.5355    4.0451    4.4550    4.7553    4.9384    5.0000 ];
[P, x, y] = P_inner4(a,b,n);
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
P_correct=25.4735;
x_correct = [3.0000    2.9248    2.7029    2.3455    1.8705    1.3017    0.6676    0.0000];
y_correct = [0    1.1126    2.1694    3.1174    3.9092    4.5048    4.8746    5.0000];
[P, x, y] = P_inner4(a,b,n);
assert(abs(P-P_correct)< tol && max(abs(x-x_correct))< tol && max(abs(y-y_correct))< tol, ...
    [ '\nYour output  \n P = ' sprintf(' %d', P) '\n x = [' sprintf(' %d ',x) ']\n'  'y = [' sprintf(' %d ',y) ']\n' ...
      'Expected output \n P = ' sprintf(' %d', P_correct) '\n x = [' sprintf(' %d ',x_correct) ']\n'  'y = [' sprintf(' %d ',y_correct) ']\n' ], ...
      P, x,y,P_correct,x_correct,y_correct);
%%
disp('test3')
a=5;
b=4;
n=8;
tol=1e-3;
P_correct=28.3161;
x_correct = [5.0000    4.9039    4.6194    4.1573    3.5355    2.7779    1.9134    0.9755    0.0000];
y_correct = [0    0.7804    1.5307    2.2223    2.8284    3.3259    3.6955    3.9231    4.0000];
[P, x, y] = P_inner4(a,b,n);
assert(abs(P-P_correct)< tol && max(abs(x-x_correct))< tol && max(abs(y-y_correct))< tol, ...
    [ '\nYour output  \n P = ' sprintf(' %d', P) '\n x = [' sprintf(' %d ',x) ']\n'  'y = [' sprintf(' %d ',y) ']\n' ...
      'Expected output \n P = ' sprintf(' %d', P_correct) '\n x = [' sprintf(' %d ',x_correct) ']\n'  'y = [' sprintf(' %d ',y_correct) ']\n' ], ...
      P, x,y,P_correct,x_correct,y_correct);