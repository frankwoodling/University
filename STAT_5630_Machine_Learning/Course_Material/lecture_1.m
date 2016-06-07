a=[1,2,3,4,5];
a=1:5;
%%%%%%%%%%%%%%%
X=[1,2,3;3,4,5];
X(1,2);
%%Transpose of a matrix: 
X'
%%%Row(column)
X(1,:) X(:,1)
%%%End key word:
X(end,:) X(:,end)
%%%Logical indexing:
X > 1
%%%Turn those index to 100:
X(X > 1)=100;
%%%% Operations on vectors and matrix:
%Transpose, subtraction, addition, multiplication, elementwise operations
X=[1,2,3;2,3,4;3,4,5];Y=[10,11;11,12;12,15];Z=X*Y;
Y=[10,11];
%%%%Rank, inverse matrix, linear independent, determinant, 
rank(X), inv(X),det(X)
%%%Create function, for loops, while, conditional
%%%%%%%%%%
%Quadratic function:
x=-10:20/100:10;
y=x.^2-3*x +1;
plot(x,y)
%%%%%%%%%%%%%%%%%%%%
x=-10:20/100:10;
y=-2*x.^2-3*x +1;
plot(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%