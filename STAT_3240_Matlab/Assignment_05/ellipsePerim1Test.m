
%%
disp('test1')
a=5;b=3;tol=1e-6;
P_correct = [25.525132671881877];
[P]=ellipsePerim1(a,b,tol,'off');
tol1=1e-5;
assert( abs(P-P_correct) < tol1 , ...
    [ '\nYour output \n P = [' sprintf(' %12.9f ',P) ']\n'   ...
      'Expected output \n P = [' sprintf(' %12.9f ',P_correct) ']\n'   ], ...
      P,P_correct);
%%
disp('test2')
a=5;b=3;tol=1e-9;
P_correct = [25.526979898858897];
[P]=ellipsePerim1(a,b,tol,'off');
tol1=1e-7;
assert( abs(P-P_correct) < tol1 , ...
    [ '\nYour output \n P = [' sprintf(' %12.9f ',P) ']\n'   ...
      'Expected output \n P = [' sprintf(' %12.9f ',P_correct) ']\n'   ], ...
      P,P_correct);
%%
disp('test3')
a=5;b=3;tol=1e-11;
P_correct = [25.526997982457452];
[P]=ellipsePerim1(a,b,tol,'off');
tol1=1e-9;
assert( abs(P-P_correct) < tol1 , ...
    [ '\nYour output \n P = [' sprintf(' %12.9f ',P) ']\n'   ...
      'Expected output \n P = [' sprintf(' %12.9f ',P_correct) ']\n'   ], ...
      P,P_correct);