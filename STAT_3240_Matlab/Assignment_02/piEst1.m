function [ R, T, U ] = piEst1(nMax)

% Function uses three equations in order to estimate pi.  
% Each uses summations and get closer to pi as k increases.
% Function will iterate until it reaches a given maximum 
% number of iterations.

R_tot = 0;  T_tot = 0; U_tot = 0;


% Rn, Tn, Un are the summation portion of the equations.
% R_tot, T_tot, U_tot add each iteration together.
for k = 1:nMax
   
   Rn = ((-1)^(k+1))/(2*k-1);
   R_tot = (Rn + R_tot);
   
   Tn = (1/(k^2));
   T_tot = (Tn + T_tot);
   
   Un = (1/(k^4));
   U_tot = (Un + U_tot);     

end

% R, T, U are the first part of the equations.  Once the 
% summation portion is complete these multiple by the totals
% giving an estimation of pi.
R = 4*R_tot;
T = sqrt(6*T_tot);
U = (90*U_tot)^(1/4);

end 

%     n      R_error     T_error      U_error
% ---------------------------------------------
%    100    1.00e-02     9.52e-03     2.38e-07   
%    200    5.00e-03     4.77e-03     3.00e-08   
%    300    3.33e-03     3.18e-03     8.91e-09   
%    400    2.50e-03     2.39e-03     3.77e-09   
%    500    2.00e-03     1.91e-03     1.93e-09   
%    600    1.67e-03     1.59e-03     1.12e-09   
%    700    1.43e-03     1.36e-03     7.04e-10   
%    800    1.25e-03     1.19e-03     4.72e-10   
%    900    1.11e-03     1.06e-03     3.31e-10   
%   1000    1.00e-03     9.55e-04     2.42e-10   
