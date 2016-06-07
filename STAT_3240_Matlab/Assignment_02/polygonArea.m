function [ A_n1, B_n1, A_n1_error, B_n1_error  ] = polygonArea(delta )

% Function uses inner and outer polygons to approximate 
% the value of pi.  As the inner and outer areas converge
% we can calculate the amount of error (delta) between the two.
% Once both the error of each is less than delta or it
% reachs the maximum number of iterations the loop stopes.
clc
nMax  = 10E6; % Maximum number of iterations
n = 3; % The number of polygon edges, starts at 3                        

A_n1 = (n/2)*sin(2*pi/n); %  
A_error = 10E6; 

B_n1 = n*tan(pi/n);
B_error = 10E6;


% Loop runs until error of both equations are greater than
% delta or when the loop reachs the maximum number of iterations.
while (A_error > delta || B_error > delta) && n < nMax
    n = (n + 1);
    
    A_test = A_n1;
    A_n1 = (n/2)*sin(2*pi/n);
    A_error = abs(A_n1-A_test);
    
    B_test = B_n1;
    B_n1 = n*tan(pi/n);
    B_error = abs(B_n1-B_test);
    
    
end

% Subtracts pi from our value of pi and outputs the error amounts.
A_n1_error = abs(A_n1 - pi);
B_n1_error = abs(B_n1 - pi);
%disp(n);
end

