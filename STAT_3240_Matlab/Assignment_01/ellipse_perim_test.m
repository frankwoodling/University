%%
a=2;
b=1;
P1_correct = 9.683038872706693;
P2_correct = 9.688395399872688;
P3_correct = 9.688448197166149;
P4_correct = 9.694284002995701;
eps = 1e-4;
[P1,P2,P3,P4]=ellipse_perim(a,b);
assert(abs(P1-P1_correct)< eps && abs(P2-P2_correct)< eps ...
    && abs(P3-P3_correct)< eps && abs(P4-P4_correct)< eps);
%%
a=2;
b=2;
P1_correct = 12.566370614359172;
P2_correct = 12.566370614359172;
P3_correct = 12.566370614359172;
P4_correct = 12.566370614359172;
eps = 1e-4;
[P1,P2,P3,P4]=ellipse_perim(a,b);
assert(abs(P1-P1_correct)< eps && abs(P2-P2_correct)< eps ...
    && abs(P3-P3_correct)< eps && abs(P4-P4_correct)< eps);
%%
a=4;
b=1;
P1_correct = 17.063215694356561;
P2_correct = 17.153488587681966;
P3_correct = 17.156823190089113;
P4_correct = 17.278759594743864;
eps = 1e-4;
[P1,P2,P3,P4]=ellipse_perim(a,b);
assert(abs(P1-P1_correct)< eps && abs(P2-P2_correct)< eps ...
    && abs(P3-P3_correct)< eps && abs(P4-P4_correct)< eps);
