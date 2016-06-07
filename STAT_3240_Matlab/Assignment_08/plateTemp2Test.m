%%
disp('plateTemp2Test1')
hs=[2,1;4.5,3];
n=200;
plotsOn='off';
[TVals]=plateTemp2(n,hs,plotsOn);
minT=min(TVals(:));
maxT=max(TVals(:));
minT_cor=1.6424;
maxT_cor=102.1466;
tol1=2e-2;
assert( max(abs(minT-minT_cor))< tol1 && max(abs(maxT-maxT_cor))< tol1 , ...
    [ '\nYour output \nminT = [' sprintf(' %5.3f ',minT) ']\n' ...
                       'maxT = [' sprintf(' %5.3f ',maxT) ']\n\n' ...
      'Expected output \nminT_cor = [' sprintf(' %5.3f ',minT_cor) ']\n' ...
                         'maxT_cor = [' sprintf(' %5.3f ',maxT_cor)  ']\n' ], ...
      minT,maxT,minT_cor,maxT_cor);
%%
disp('plateTemp2Test2')
hs=[4,1;1,3];
n=200;
plotsOn='off';
[TVals]=plateTemp2(n,hs,plotsOn);
minT=min(TVals(:));
maxT=max(TVals(:));
minT_cor=1.6271;
maxT_cor=100.6801;
tol1=2e-2;
assert( max(abs(minT-minT_cor))< tol1 && max(abs(maxT-maxT_cor))< tol1 , ...
    [ '\nYour output \nminT = [' sprintf(' %5.3f ',minT) ']\n' ...
                       'maxT = [' sprintf(' %5.3f ',maxT) ']\n\n' ...
      'Expected output \nminT_cor = [' sprintf(' %5.3f ',minT_cor) ']\n' ...
                         'maxT_cor = [' sprintf(' %5.3f ',maxT_cor)  ']\n' ], ...
      minT,maxT,minT_cor,maxT_cor);