%%
disp('test1')
rng(1234);
n=3;
P=[1.530495370108102e-01     4.273067346779592e-01     1.357562201301701e-01;
     4.971477267172861e-01     4.243780135680270e-01     3.937548302342301e-01;
     3.498027362719038e-01     1.483152517540138e-01     4.704889496355997e-01]; 
x=1e4*ones(n,1); tol=1e-2;itMax=1e2;
y_correct=[8.013222653142662e+03 ,    1.304049420447022e+04 ,    8.946283142387110e+03 ]';
y=stationary(P, x, tol, itMax);
tol1=1e-1;
assert( max(abs(y-y_correct))< tol1 , ...
    [ '\nYour output \n y = [' sprintf(' %5.3f ',y) ']\n'   ...
      'Expected output \n y_correct = [' sprintf(' %5.3f ',y_correct) ']\n'   ], ...
      y,y_correct);
%%
disp('test2')
rng(1234);
n=4;
P=[9.403352616593504e-02     3.660303319286185e-01     3.558041182197113e-01     2.936326860538871e-01;
     3.054472080193428e-01     1.279234057701626e-01     3.252767329992822e-01     3.061945275588818e-01;
     2.149185511865772e-01     1.297403099212692e-01     1.328750956023990e-01     1.590689385594864e-01;
     3.856007146281449e-01     3.763059523799496e-01     1.860440531786074e-01     2.411038478277447e-01]; 
x=1e4*ones(n,1); tol=1e-2;itMax=1e2;
y_correct=[ 1.076044218126141e+04     1.049292186219394e+04     6.486086091141002e+03     1.226054986540365e+04]';
y=stationary(P, x, tol, itMax);
tol1=1e-1;
assert( max(abs(y-y_correct))< tol1 , ...
    [ '\nYour output \n y = [' sprintf(' %5.3f ',y) ']\n'   ...
      'Expected output \n y_correct = [' sprintf(' %5.3f ',y_correct) ']\n'   ], ...
      y,y_correct);
%%
disp('test3')
rng(1234);
n=5;
P=[6.799449936885421e-02     8.558634770422759e-02     1.362994965138861e-01     2.053019866991249e-01     1.547682922980757e-01;
     2.208651620299787e-01     8.680193596570063e-02     1.908387020358165e-01     1.840425431909471e-01     2.610234972704731e-01;
     1.554049910584407e-01     2.517651237446407e-01     2.603442085420700e-01     5.036901755428663e-03     3.197334662091469e-02;
     2.788231880313261e-01     3.008285855313309e-01     2.714819423155116e-01     2.827225927947407e-01     1.564386249017721e-01;
     2.769121595114003e-01     2.750180070541002e-01     1.410356505927158e-01     3.228959755597586e-01     3.957962389087644e-01 ]; 
x=1e4*ones(n,1); tol=1e-2;itMax=1e2;
y_correct=[ 6.976852435419694e+03     9.741053444185462e+03     5.534224844738383e+03     1.226826216777133e+04     1.547960710788513e+04]';
y=stationary(P, x, tol, itMax);
tol1=1e-1;
assert( max(abs(y-y_correct))< tol1 , ...
    [ '\nYour output \n y = [' sprintf(' %5.3f ',y) ']\n'   ...
      'Expected output \n y_correct = [' sprintf(' %5.3f ',y_correct) ']\n'   ], ...
      y,y_correct);
  %%
disp('test4')
rng(1234);
n=4;
P=[9.403352616593504e-02     3.660303319286185e-01     3.558041182197113e-01     2.936326860538871e-01;
     3.054472080193428e-01     1.279234057701626e-01     3.252767329992822e-01     3.061945275588818e-01;
     2.149185511865772e-01     1.297403099212692e-01     1.328750956023990e-01     1.590689385594864e-01;
     3.856007146281449e-01     3.763059523799496e-01     1.860440531786074e-01     2.411038478277447e-01]; 
x=1e3*ones(n,1);x=x.*[8 9 11 12]'; tol=1e-2;itMax=1e2;
y_correct=[10760.445  10492.924  6486.085  12260.546]';
y=stationary(P, x, tol, itMax);
tol1=1e-1;
assert( max(abs(y-y_correct))< tol1 , ...
    [ '\nYour output \n y = [' sprintf(' %5.3f ',y) ']\n'   ...
      'Expected output \n y_correct = [' sprintf(' %5.3f ',y_correct) ']\n'   ], ...
      y,y_correct);