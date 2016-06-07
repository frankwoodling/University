%%
r1=2;
r2=1;
A_correct = 34.687530;
approx_correct=28.274333;
eps = 1e-4;
[A,approx]=spheroid_area(r1,r2);
assert(abs(A-A_correct)< eps && abs(approx-approx_correct)< eps)
%%
r1=4;
r2=1;
A_correct = 1.139211154160575e+02;
approx_correct=78.539816339744831;
eps = 1e-4;
[A,approx]=spheroid_area(r1,r2);
assert(abs(A-A_correct)< eps && abs(approx-approx_correct)< eps)
%%
r1=6378.137;
r2=6356.752;
A_correct = 5.100656049442061e+08;
approx_correct=5.094953216397448e+08;
eps = 1e-4;
[A,approx]=spheroid_area(r1,r2);
assert(abs(A-A_correct)< eps && abs(approx-approx_correct)< eps)
