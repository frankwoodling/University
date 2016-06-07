R=[5,1,0,1;5,0,0,1;1,1,0,5;1,0,1,5;0,1,1,5];
K=2;
[n,m]=size(R);
P=rand(n,K);Q=rand(m,K);
lambda=.02;
[nP,nQ]=matrix_factorization(R,P,Q,K,lambda);
nR=nP*nQ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
