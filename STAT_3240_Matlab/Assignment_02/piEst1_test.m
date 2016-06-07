%%
disp('test1')
nMax=100;
R_correct = 3.131592903558554;
T_correct = 3.132076531809105;
U_correct = 3.141592415307368;
eps = 1e-4;
[ R, T, U ] = piEst1(nMax);
assert(abs(R-R_correct)< eps && abs(T-T_correct)< eps ...
    && abs(U-U_correct)< eps, ...
    '\nYour output \n %f  %f  %f   \nExpected output  \n %f  %f  %f ',...
    R, T, U,  R_correct, T_correct, U_correct);
%%
disp('test2')
nMax=1;
R_correct = 4;
T_correct = 2.449489742783178;
U_correct = 3.080070288241023;
eps = 1e-4;
[ R, T, U ] = piEst1(nMax);
assert(abs(R-R_correct)< eps && abs(T-T_correct)< eps ...
    && abs(U-U_correct)< eps, ...
 '\nYour output \n %f  %f  %f   \nExpected output  \n %f  %f  %f ',...
    R, T, U,  R_correct, T_correct, U_correct);
%%
disp('test3')
nMax=500;
R_correct = 3.139592655589785;
T_correct = 3.139684123138722;
U_correct = 3.141592651660499;
eps = 1e-4;
[ R, T, U ] = piEst1(nMax);
assert(abs(R-R_correct)< eps && abs(T-T_correct)< eps ...
    && abs(U-U_correct)< eps, ...
    '\nYour output \n %f  %f  %f   \nExpected output  \n %f  %f  %f ',...
    R, T, U,  R_correct, T_correct, U_correct);
%%
disp('test4')
nMax=1000;
R_correct = 3.140592653839794;
T_correct = 3.140638056205995;
U_correct = 3.141592653348270;
eps = 1e-4;
[ R, T, U ] = piEst1(nMax);
assert(abs(R-R_correct)< eps && abs(T-T_correct)< eps ...
    && abs(U-U_correct)< eps, ...
    '\nYour output \n %f  %f  %f   \nExpected output  \n %f  %f  %f ',...
    R, T, U,  R_correct, T_correct, U_correct);
