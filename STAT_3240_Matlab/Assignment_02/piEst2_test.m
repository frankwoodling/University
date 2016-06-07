%%
disp('test1')
tol=1e-6;
a_correct = 3.141593304503082;
b_correct = 3.141591772182177;
eps = 1e-6;
[ a, b ] = piEst2(tol);
assert(abs(a-a_correct)< eps && abs(b-b_correct)< eps, ...
    '\nYour output \n %f  %f     \nExpected output  \n %f  %f  ',...
    a, b, a_correct, b_correct);
%%
disp('test2')
tol=1e-2;
a_correct = 3.137852891595680;
b_correct = 3.140597029326060;
eps = 1e-6;
[ a, b ] = piEst2(tol);
assert(abs(a-a_correct)< eps && abs(b-b_correct)< eps, ...
    '\nYour output \n %f  %f     \nExpected output  \n %f  %f  ',...
    a, b, a_correct, b_correct);
%%
disp('test3')
tol=1e-9;
a_correct = 3.141592654172576;
b_correct = 3.141592652615309;
eps = 1e-6;
[ a, b ] = piEst2(tol);
assert(abs(a-a_correct)< eps && abs(b-b_correct)< eps , ...
    '\nYour output \n %f  %f     \nExpected output  \n %f  %f  ',...
    a, b, a_correct, b_correct);
%%  loop guard should terminate loop
disp('test4')
tol=1e-15;
a_correct = 3.141592653595636;
b_correct = 3.141592653589792;
eps = 1e-6;
[ a, b ] = piEst2(tol);
assert(abs(a-a_correct)< eps && abs(b-b_correct)< eps , ...
    '\nYour output \n %f  %f     \nExpected output  \n %f  %f  ',...
    a, b, a_correct, b_correct);
