%%
disp('SortPointTest1')
rng(1234);
n=5;
x=rand(n,1); y=rand(n,1);
    
P = repmat(struct('x',1,'y',1), n, 1 );
for i=1:n
    P(i)=struct('x',x(i),'y',y(i));
end
tol1=1e-3;
Q1x=0.4377;
Q1y= 0.8019;
Q2x=0.4377;
Q2y= 0.8019;
Q3x=0.5633;
Q3y= 0.6370;

[Q1, Q2, Q3] = SortPoints(P);
assert( abs(Q1.x - Q1x)<tol1 && abs(Q1.y - Q1y)<tol1 && ...
    abs(Q2.x - Q2x)<tol1 && abs(Q2.y - Q2y)<tol1 && ...
    abs(Q3.x - Q3x)<tol1 && abs(Q3.y - Q3y)<tol1 , ...
    [ '\nYour output [Q1,Q2,Q3] = [\n' sprintf('%8.3f %8.3f \n',Q1.x,Q1.y,Q2.x,Q2.y,Q3.x,Q3.y) ']\n' ...
      '\nExpected output [Q1,Q2,Q3] = [\n' sprintf('%8.3f %8.3f \n',Q1x,Q1y,Q2x,Q2y,Q3x,Q3y) ']\n\n' ], ...
      Q1.x,Q1.y,Q2.x,Q2.y,Q3.x,Q3.y,Q1x,Q1y,Q2x,Q2y,Q3x,Q3y);
%%
disp('SortPointTest2')
rng(1235);
n=7;
x=rand(n,1); y=rand(n,1);
    
P = repmat(struct('x',1,'y',1), n, 1 );
for i=1:n
    P(i)=struct('x',x(i),'y',y(i));
end
tol1=1e-3;
Q1x=0.9538;
Q1y= 0.3660;
Q2x=0.7488;
Q2y= 0.7742;
Q3x=0.7428;
Q3y= 0.6100;

[Q1, Q2, Q3] = SortPoints(P);
assert( abs(Q1.x - Q1x)<tol1 && abs(Q1.y - Q1y)<tol1 && ...
    abs(Q2.x - Q2x)<tol1 && abs(Q2.y - Q2y)<tol1 && ...
    abs(Q3.x - Q3x)<tol1 && abs(Q3.y - Q3y)<tol1 , ...
    [ '\nYour output [Q1,Q2,Q3] = [\n' sprintf('%8.3f %8.3f \n',Q1.x,Q1.y,Q2.x,Q2.y,Q3.x,Q3.y) ']\n' ...
      '\nExpected output [Q1,Q2,Q3] = [\n' sprintf('%8.3f %8.3f \n',Q1x,Q1y,Q2x,Q2y,Q3x,Q3y) ']\n\n' ], ...
      Q1.x,Q1.y,Q2.x,Q2.y,Q3.x,Q3.y,Q1x,Q1y,Q2x,Q2y,Q3x,Q3y);

%%
disp('SortPointTest3')
rng(1236);
n=100;
x=rand(n,1); y=rand(n,1);
    
P = repmat(struct('x',1,'y',1), n, 1 );
for i=1:n
    P(i)=struct('x',x(i),'y',y(i));
end
tol1=1e-3;
Q1x=.4820;
Q1y= 0.5721;
Q2x=0.4710;
Q2y= 0.5076;
Q3x=0.4771;
Q3y= 0.5047;

[Q1, Q2, Q3] = SortPoints(P);
assert( abs(Q1.x - Q1x)<tol1 && abs(Q1.y - Q1y)<tol1 && ...
    abs(Q2.x - Q2x)<tol1 && abs(Q2.y - Q2y)<tol1 && ...
    abs(Q3.x - Q3x)<tol1 && abs(Q3.y - Q3y)<tol1 , ...
    [ '\nYour output [Q1,Q2,Q3] = [\n' sprintf('%8.3f %8.3f \n',Q1.x,Q1.y,Q2.x,Q2.y,Q3.x,Q3.y) ']\n' ...
      '\nExpected output [Q1,Q2,Q3] = [\n' sprintf('%8.3f %8.3f \n',Q1x,Q1y,Q2x,Q2y,Q3x,Q3y) ']\n\n' ], ...
      Q1.x,Q1.y,Q2.x,Q2.y,Q3.x,Q3.y,Q1x,Q1y,Q2x,Q2y,Q3x,Q3y);

