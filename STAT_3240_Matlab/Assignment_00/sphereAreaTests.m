%%
r = 1;
y_correct = 12.5664;
eps = 1e-4;
assert(abs(sphereArea(r)-y_correct) < eps)
%%
r=0;
y_correct = 0;
eps = 1e-4;
assert(abs(sphereArea(r)-y_correct) < eps)
%%
r=6378;
y_correct = 5.111859325225255e+08;
eps = 1e-4;
assert(abs(sphereArea(r)-y_correct) < eps)