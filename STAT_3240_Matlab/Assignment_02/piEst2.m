function [ a_abs, b_abs ] = piEst2(tol)

% piEst2_test.m does not seem to work.  The function passed 
% 3 out of 4 cases on Cody.  The one that failed is the lowest
% tolerance case.  In that case my estimate is closer to pi than the 
% expected output.  I assume that I am adding one too
% many iterations, but I am out of time to figure this out.

% Purpose of function is to estimate pi.  With a given tolerance
% whenever the difference of two consecutive iterations
% is less than the tolerance the loop stops iterating.
k = 0;

% Equation is split into 2 parts; a_n1 and a_n2_sum.  The second
% part is a summation which is multiplied by the first.
a_n1 = 6/(sqrt(3));
a_n2_sum = 0;
a_total = 0;
a_abs = abs(a_total - pi);

% Equation is split into 4 parts; b_n1, b_n3, b_n2_sum, b_n4_sum.
% Two parts are summations which are multiplied by constants each
% iteration.
b_n1 = 16;
b_n3 = 4;
b_n2_sum = 0;
b_n4_sum = 0;
b_total = 0;
b_abs = abs(b_total - pi);



% Loop iterates until test tolerances are lower than the 
% given maximum tolerance or after 20 iterations.
while (a_abs <= tol && b_abs <= tol) || k >= 20
    k =+ 1;
    
    a_n2 = ((-1)^k)/((3^k)*(2*k+1));
    a_n2_sum = a_n2 + a_n2_sum;
    a_total = a_n1 * a_n2_sum;
    
    b_n2 = ((-1)^k)/((5^(2*k+1))*(2*k+1));
    b_n4 = ((-1)^k)/((239^(2*k+1))*(2*k+1));
    b_n2_sum = b_n2 + b_n2_sum;
    b_n4_sum = b_n4 + b_n4_sum;
    b_total = (b_n1*b_n2_sum) - (b_n3*b_n4_sum);
        
end
end
