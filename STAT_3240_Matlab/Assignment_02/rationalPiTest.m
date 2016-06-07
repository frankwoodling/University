%%
disp('test1')
d=3;
pBest_correct = 201;
qBest_correct = 64;
err_pq_correct= 9.676535897931160e-04;
eps = 1e-6;
[ pBest, qBest, err_pq ] = rationalPi( d );
assert(abs(pBest-pBest_correct)< eps && abs(qBest-qBest_correct)< eps ...
    && abs(err_pq-err_pq_correct)< eps , ...
    '\nYour output  \n %d  %d  %e \nExpected output  \n %d  %d  %e ',...
    pBest, qBest, err_pq,pBest_correct,qBest_correct,err_pq_correct);
%%
disp('test2')
d=5;
pBest_correct = 355;
qBest_correct = 113;
err_pq_correct= 2.667641894049666e-07;
eps = 1e-6;
[ pBest, qBest, err_pq ] = rationalPi( d );
assert(abs(pBest-pBest_correct)< eps && abs(qBest-qBest_correct)< eps ...
    && abs(err_pq-err_pq_correct)< eps , ...
    '\nYour output  \n %d  %d  %e \nExpected output  \n %d  %d  %e ',...
    pBest, qBest, err_pq,pBest_correct,qBest_correct,err_pq_correct);
%%
disp('test3')
d=6;
pBest_correct = 355;
qBest_correct = 113;
err_pq_correct= 2.667641894049666e-07;
eps = 1e-6;
[ pBest, qBest, err_pq ] = rationalPi( d );
assert(abs(pBest-pBest_correct)< eps && abs(qBest-qBest_correct)< eps ...
    && abs(err_pq-err_pq_correct)< eps , ...
    '\nYour output  \n %d  %d  %e \nExpected output  \n %d  %d  %e ',...
    pBest, qBest, err_pq,pBest_correct,qBest_correct,err_pq_correct);
