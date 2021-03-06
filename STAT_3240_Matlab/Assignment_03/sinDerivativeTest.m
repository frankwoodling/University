
%%
disp('test1')
x=pi/4;
tol=1e-6;
h_best_correct = [1.000e-08];
e_best_correct = [3.0503e-09];
[h_best,e_best] = sinDerivative(x);
assert( max(abs(h_best-h_best_correct))< tol && ....
    max(abs(e_best-e_best_correct))< tol , ...
    [ '\nYour output \nh_best = [' sprintf(' %d ',h_best) ']\n'  'e_best = [' sprintf(' %d ',e_best) ']\n' ...
      'Expected output \nh_best = [' sprintf(' %d ',h_best_correct) ']\n'  'e_best = [' sprintf(' %d ',e_best_correct) ']\n' ], ...
      h_best,e_best,h_best_correct,e_best_correct);
%%
disp('test2')
x=pi;
tol=1e-6;
h_best_correct = [1.0000e-05];
e_best_correct = [1.0116e-11];
[h_best,e_best] = sinDerivative(x);
assert( max(abs(h_best-h_best_correct))< tol && ....
    max(abs(e_best-e_best_correct))< tol , ...
    [ '\nYour output \nh_best = [' sprintf(' %d ',h_best) ']\n'  'e_best = [' sprintf(' %d ',e_best) ']\n' ...
      'Expected output \nh_best = [' sprintf(' %d ',h_best_correct) ']\n'  'e_best = [' sprintf(' %d ',e_best_correct) ']\n' ], ...
      h_best,e_best,h_best_correct,e_best_correct);
%%
disp('test3')
x=5*pi/4;
tol=1e-6;
h_best_correct = [1.000e-08];
e_best_correct = [8.0520e-09];
[h_best,e_best] = sinDerivative(x);
assert( max(abs(h_best-h_best_correct))< tol && ....
    max(abs(e_best-e_best_correct))< tol , ...
    [ '\nYour output \nh_best = [' sprintf(' %d ',h_best) ']\n'  'e_best = [' sprintf(' %d ',e_best) ']\n' ...
      'Expected output \nh_best = [' sprintf(' %d ',h_best_correct) ']\n'  'e_best = [' sprintf(' %d ',e_best_correct) ']\n' ], ...
      h_best,e_best,h_best_correct,e_best_correct);
