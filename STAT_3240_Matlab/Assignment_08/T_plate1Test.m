%%
disp('T_plate1 Test 1');
hs=[2,1;4.5,3];
x=[1,5];y=[1,2];
tau = T_plate1(x,y,hs);
tau_cor=[67.2114 , 55.6907];
tol1=1e-2;
assert( max(abs(tau-tau_cor))< tol1 , ...
    [ '\nYour output \ntau = [' sprintf(' %5.3f ',tau) ']\n\n' ...                     
      'Expected output \ntau_cor = [' sprintf(' %5.3f ',tau_cor) ']\n'], ...
      tau,tau_cor);
%%
disp('T_plate1 Test 2');
hs=[2,5;1.5,3];
x=[1,5];y=[1,2];
tau = T_plate1(x,y,hs);
tau_cor=[22.562  0.661];
tol1=1e-2;
assert( max(abs(tau-tau_cor))< tol1 , ...
    [ '\nYour output \ntau = [' sprintf(' %5.3f ',tau) ']\n\n' ...                     
      'Expected output \ntau_cor = [' sprintf(' %5.3f ',tau_cor) ']\n'], ...
      tau,tau_cor);
