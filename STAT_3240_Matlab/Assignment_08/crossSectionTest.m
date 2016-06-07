%%
disp('crossSectionTest1')
hs=[2,1;4.5,3];
endpts=[1,1;5,3];
n=200;
plotsOn='off';
[TVals]=crossSection(n,hs,endpts,plotsOn);
minT=min(TVals(:));
maxT=max(TVals(:));
minT_cor=67.2114;
maxT_cor=96.7510;
tol1=2e-2;
assert( max(abs(minT-minT_cor))< tol1 && max(abs(maxT-maxT_cor))< tol1 , ...
    [ '\nYour output \nminT = [' sprintf(' %5.3f ',minT) ']\n' ...
                       'maxT = [' sprintf(' %5.3f ',maxT) ']\n\n' ...
      'Expected output \nminT_cor = [' sprintf(' %5.3f ',minT_cor) ']\n' ...
                         'maxT_cor = [' sprintf(' %5.3f ',maxT_cor)  ']\n' ], ...
      minT,maxT,minT_cor,maxT_cor);
%%
disp('crossSectionTest2')
hs=[4,1;1,3];
endpts=[1,5;5,1];
n=200;
plotsOn='off';
[TVals]=crossSection(n,hs,endpts,plotsOn);
minT=min(TVals(:));
maxT=max(TVals(:));
minT_cor=24.1265;
maxT_cor=85.2415;
tol1=2e-2;
assert( max(abs(minT-minT_cor))< tol1 && max(abs(maxT-maxT_cor))< tol1 , ...
    [ '\nYour output \nminT = [' sprintf(' %5.3f ',minT) ']\n' ...
                       'maxT = [' sprintf(' %5.3f ',maxT) ']\n\n' ...
      'Expected output \nminT_cor = [' sprintf(' %5.3f ',minT_cor) ']\n' ...
                         'maxT_cor = [' sprintf(' %5.3f ',maxT_cor)  ']\n' ], ...
      minT,maxT,minT_cor,maxT_cor);