%%
disp('CentroidPointTest1')
rng(1234);
n=5;
x=rand(n,1); y=rand(n,1);
    
P = repmat(struct('x',1,'y',1), n, 1 );
for i=1:n
    P(i)=struct('x',x(i),'y',y(i));
end
tol1=1e-3;
Q3x=0.5633;
Q3y= 0.6370;

Q3 = CentroidPoints(P);
assert( abs(Q3.x - Q3x)<tol1 && abs(Q3.y - Q3y)<tol1 , ...
    [ '\nYour output Q3 = [' sprintf('%8.3f %8.3f ',Q3.x,Q3.y) ']\n' ...
      '\nExpected output Q3 = [' sprintf('%8.3f %8.3f ',Q3x,Q3y) ']\n\n' ], ...
      Q3.x,Q3.y,Q3x,Q3y);
%%
disp('CentroidPointTest2')
rng(1235);
n=7;
x=rand(n,1); y=rand(n,1);
    
P = repmat(struct('x',1,'y',1), n, 1 );
for i=1:n
    P(i)=struct('x',x(i),'y',y(i));
end
tol1=1e-3;
Q3x=0.7428;
Q3y=0.6100;

Q3 = CentroidPoints(P);
assert( abs(Q3.x - Q3x)<tol1 && abs(Q3.y - Q3y)<tol1 , ...
    [ '\nYour output Q3 = [' sprintf('%8.3f %8.3f ',Q3.x,Q3.y) ']\n' ...
      '\nExpected output Q3 = [' sprintf('%8.3f %8.3f ',Q3x,Q3y) ']\n\n' ], ...
      Q3.x,Q3.y,Q3x,Q3y);
%%
disp('CentroidPointTest3')
rng(1236);
n=100;
x=rand(n,1); y=rand(n,1);
    
P = repmat(struct('x',1,'y',1), n, 1 );
for i=1:n
    P(i)=struct('x',x(i),'y',y(i));
end
tol1=1e-3;
Q3x=0.4771;
Q3y=0.5047;

Q3 = CentroidPoints(P);
assert( abs(Q3.x - Q3x)<tol1 && abs(Q3.y - Q3y)<tol1 , ...
    [ '\nYour output Q3 = [' sprintf('%8.3f %8.3f ',Q3.x,Q3.y) ']\n' ...
      '\nExpected output Q3 = [' sprintf('%8.3f %8.3f ',Q3x,Q3y) ']\n\n' ], ...
      Q3.x,Q3.y,Q3x,Q3y);
