
% Course: STAT 5630
% Instructor: Minh Pham

% Homework number: 2
% Author(s): Xin Jin

% Pledge: On our honor as a student, we have neither given nor 
% received aid on this assignment outside of the guidelines.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 1:
load('problem_1.mat')
beta = my_SLR(X,y);

% Answer:
% ans =

%    -0.1242    0.9645    0.4780


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 2:
load('problem_2.mat')
[beta,Rsqr] = my_MLR(X,y);

% Answer:
% beta =

%    0.1289
%    0.9100
%    1.9360
%    2.8548


% Rsqr =

%    0.8778

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 3:
X  = normrnd(0,1,[100,1]);

noise = normrnd(0,0.25,[100,1]);

Y = -1+2*X+noise;

scatter(X,Y);
% The plot illustrates that X and y have a strong linear relationship.

fitlm(X,Y);
% The estimated coefficients is quite close to the true coefficients.

% There is a relationship. We can do a t-test whose
% null hypothesis is "beta1=0", i.e. there's no relationship between
% x and y. Since the p-value of x (1.7059e-87) is quite small, 
% we can reject the null hypothesis, which means there exists relationship
% between x and y.