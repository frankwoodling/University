%%
disp('arrayNoiseTest1')
arrayIn=[1 2 3; 4 5 6; 7 8 9];
rng(1234)
noise='uniform'; gain=1; plotsOn='off';
arrayOut=arrayNoise(arrayIn,noise,gain,plotsOn);
arrayOutRef= [ 0.6915    2.2854    2.7765;
               4.1221    5.2800    6.3019;
               6.9377    7.7726    9.4581];
assert( sum(sum(abs(arrayOut-arrayOutRef))) < 1e-3 , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOut) ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOutRef') ']\n\n' ], ...
     arrayOut,arrayOutRef);
%%
disp('arrayNoiseTest2')
arrayIn=[1 2 3; 4 5 6; 7 8 9];
rng(1234)
noise='normal'; gain=1; plotsOn='off';
arrayOut=arrayNoise(arrayIn,noise,gain,plotsOn);
arrayOutRef= [  0.0528    3.1890    2.5551;
                4.5401    6.3170    7.3284;
                6.7834    7.5944    9.8338];
assert( sum(sum(abs(arrayOut-arrayOutRef))) < 1e-3 , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOut) ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOutRef') ']\n\n' ], ...
     arrayOut,arrayOutRef);
%%
disp('arrayNoiseTest3')
arrayIn=[1 2 3; 4 5 6; 7 8 9; 10 11 12];
rng(1234)
noise='uniform'; gain=2; plotsOn='off';
arrayOut=arrayNoise(arrayIn,noise,gain,plotsOn);
arrayOutRef= [     0.3830    2.5600    3.9163
    4.2442    4.5452    6.7519
    6.8755    7.5529    8.7156
   10.5707   11.6037   12.0020];
assert( sum(sum(abs(arrayOut-arrayOutRef))) < 1e-3 , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOut) ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOutRef') ']\n\n' ], ...
     arrayOut,arrayOutRef);
