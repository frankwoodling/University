%%
disp('test1')
delta=1e-6;
A_n1_correct = 3.141420984426724;
B_n1_correct = 3.141678492392858;
A_n1_error_correct= 1.716691630688771e-04;
B_n1_error_correct= 8.583880306511915e-05;
eps = 1e-6;
[ A_n1, B_n1, A_n1_error, B_n1_error  ] = polygonArea(delta );
assert(abs(A_n1-A_n1_correct)< eps && abs(B_n1-B_n1_correct)< eps ...
    && abs(A_n1_error-A_n1_error_correct)< eps && abs(B_n1_error-B_n1_error_correct)< eps , ...
    '\nYour output \n %f  %f  %e  %e   \nExpected output  \n %f  %f  %e  %e',...
    A_n1, B_n1, A_n1_error, B_n1_error, A_n1_correct, B_n1_correct, A_n1_error_correct, B_n1_error_correct);
%%
disp('test2')
delta=1e-3;
A_n1_correct = 3.125667198004746;
B_n1_correct = 3.149591886933264;
A_n1_error_correct= 0.015925455585047;
B_n1_error_correct= 0.007999233343471;
eps = 1e-6;
[ A_n1, B_n1, A_n1_error, B_n1_error  ] = polygonArea(delta );
assert(abs(A_n1-A_n1_correct)< eps && abs(B_n1-B_n1_correct)< eps ...
    && abs(A_n1_error-A_n1_error_correct)< eps && abs(B_n1_error-B_n1_error_correct)< eps , ...
 '\nYour output \n %f  %f  %e  %e   \nExpected output  \n %f  %f  %e  %e',...
    A_n1, B_n1, A_n1_error, B_n1_error, A_n1_correct, B_n1_correct, A_n1_error_correct, B_n1_error_correct);   
%%
disp('test3')
delta=1e-9;
A_n1_correct = 3.141590925934229;
B_n1_correct = 3.141593517418003;
A_n1_error_correct= 1.727655564387476e-06;
B_n1_error_correct= 8.638282102957362e-07;
eps = 1e-6;
[ A_n1, B_n1, A_n1_error, B_n1_error  ] = polygonArea(delta );
assert(abs(A_n1-A_n1_correct)< eps && abs(B_n1-B_n1_correct)< eps ...
    && abs(A_n1_error-A_n1_error_correct)< eps && abs(B_n1_error-B_n1_error_correct)< eps , ...
'\nYour output \n %f  %f  %e  %e   \nExpected output  \n %f  %f  %e  %e',...
    A_n1, B_n1, A_n1_error, B_n1_error, A_n1_correct, B_n1_correct, A_n1_error_correct, B_n1_error_correct);
