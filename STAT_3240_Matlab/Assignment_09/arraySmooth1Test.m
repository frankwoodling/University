%%
disp('arraySmooth1Test1')
arrayIn=[1 2 3; 4 5 6; 7 8 9];
n=1; plotsOn='off';
arrayOut=arraySmooth1(arrayIn,n,plotsOn);
arrayOutRef=[   3.6667    4.0000    4.3333
                4.6667    5.0000    5.3333
                5.6667    6.0000    6.3333];
assert( sum(sum(abs(arrayOut-arrayOutRef))) < 1e-3 , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOut) ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOutRef') ']\n\n' ], ...
     arrayOut,arrayOutRef);
%%
disp('arraySmooth1Test2')
% Smearing Unit Impulse arrayIn
arrayIn=zeros(5,5);arrayIn(3,3)=1;
n=1; plotsOn='off';
arrayOut=arraySmooth1(arrayIn,n,plotsOn);
arrayOutRef=[          0         0         0         0         0
         0    0.1111    0.1111    0.1111         0
         0    0.1111    0.1111    0.1111         0
         0    0.1111    0.1111    0.1111         0
         0         0         0         0         0];
assert( sum(sum(abs(arrayOut-arrayOutRef))) < 1e-3 , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f %8.3f \n',arrayOut) ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f %8.3f %8.3f \n',arrayOutRef') ']\n\n' ], ...
     arrayOut,arrayOutRef);
%%
disp('arraySmooth1Test3')
% rectangle arrayIn 
arrayIn=[1 2 3; 4 5 6 ;7 8 9 ;10 11 12; 13 14 15];
n=1; plotsOn='off';
arrayOut=arraySmooth1(arrayIn,n,plotsOn);
arrayOutRef=[    3.6667    4.0000    4.3333
    4.6667    5.0000    5.3333
    7.6667    8.0000    8.3333
   10.6667   11.0000   11.3333
   11.6667   12.0000   12.3333];
assert( sum(sum(abs(arrayOut-arrayOutRef))) < 1e-3 , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f \n',arrayOut) ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOutRef') ']\n\n' ], ...
     arrayOut,arrayOutRef);
%%
disp('arraySmooth1Test4')
% Setting n=2 
arrayIn=[    47     3    29    29    50;
    23    34    17     1    48;
    46    30    26    31    40;
     3    27     6    46    15;
    10     3    31    40    32];
n=2; plotsOn='off';
arrayOut=arraySmooth1(arrayIn,n,plotsOn);
arrayOutRef=[   27.0800   26.2000   30.0000   26.3200   25.6800;
   23.5200   24.0400   26.9600   25.6000   24.2800;
   21.6400   23.1600   26.6800   27.4000   27.8800;
   19.9600   23.0800   24.2400   27.4000   26.0000;
   21.2800   25.2400   26.2400   29.6800   28.8000];
assert( sum(sum(abs(arrayOut-arrayOutRef))) < 1e-3 , ...
    [ '\nYour output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f \n',arrayOut) ']\n' ...
      '\nExpected output [y] = [\n' sprintf('%8.3f  %8.3f %8.3f  \n',arrayOutRef') ']\n\n' ], ...
     arrayOut,arrayOutRef);  
 %%
disp('Performance Timing Test')
rng(1234);
arrayIn=randi(50,200,200);
n=50;plotsOn='off';
tic;
[arrayOut]=arraySmooth1(arrayIn,n,plotsOn);
time_student=toc
tic;
[arrayOut]=arraySmoothRef(arrayIn,n,plotsOn);
time_solution=toc
assert( (time_student/time_solution) < 1.2 , ...
    [ '\nYour timing \n P = [' sprintf(' %8.4f ',time_student) ']\n'   ...
      'Solution timing \n P = [' sprintf(' %8.4f ',time_solution) ']\n'   ], ...
      time_student,time_solution);