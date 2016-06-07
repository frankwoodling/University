%%
disp('test1')
rng(1234);
n=3;
P=transitionMatrix(n);
P_correct=[     0.1530    0.4273    0.1358;
    0.4971    0.4244    0.3938;
    0.3498    0.1483    0.4705];
tol1=1e-3;
assert( max(abs(P(:)-P_correct(:)))< tol1 , ...
    [ '\nYour output \n P = \n' sprintf(' %6.4f %6.3f %6.3f \n',P') '\n'   ...
      'Expected output \n P_correct = \n' sprintf(' %6.3f %6.3f %6.3f \n',P_correct') '\n'   ], ...
      P,P_correct);
%%
disp('test2')
rng(1234);
n=4;
P=transitionMatrix(n);
P_correct=[  0.0940    0.3660    0.3558    0.2936;
    0.3054    0.1279    0.3253    0.3062;
    0.2149    0.1297    0.1329    0.1591;
    0.3856    0.3763    0.1860    0.2411  ];
tol1=1e-3;
assert( max(abs(P(:)-P_correct(:)))< tol1 , ...
    [ '\nYour output \n P = \n' sprintf(' %6.4f %6.3f %6.3f %6.3f \n',P') '\n'   ...
      'Expected output \n P_correct = \n' sprintf(' %6.3f %6.3f %6.3f %6.3f \n',P_correct') '\n'   ], ...
      P,P_correct);
%%
disp('test3')
rng(1234);
n=5;
P=transitionMatrix(n);
P_correct=[      0.0680    0.0856    0.1363    0.2053    0.1548;
    0.2209    0.0868    0.1908    0.1840    0.2610;
    0.1554    0.2518    0.2603    0.0050    0.0320;
    0.2788    0.3008    0.2715    0.2827    0.1564;
    0.2769    0.2750    0.1410    0.3229    0.3958];
tol1=1e-3;
assert( max(abs(P(:)-P_correct(:)))< tol1 , ...
    [ '\nYour output \n P = \n' sprintf(' %6.4f %6.3f %6.3f %6.3f %6.3f \n',P') '\n'   ...
      'Expected output \n P_correct = \n' sprintf(' %6.3f %6.3f %6.3f %6.3f %6.3f \n',P_correct') '\n'   ], ...
      P,P_correct);