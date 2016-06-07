%%
L=5;
R=7;
maxVal_correct=1;
eps = 1e-4;
assert(abs(intervalMax(L,R)-maxVal_correct) < eps)
%%
L=5;
R=6;
maxVal_correct=0.9602;
eps = 1e-4;
assert(abs(intervalMax(L,R)-maxVal_correct) < eps)
%%
L=13;
R=16;
maxVal_correct=0.9074;
eps = 1e-4;
assert(abs(intervalMax(L,R)-maxVal_correct) < eps)
