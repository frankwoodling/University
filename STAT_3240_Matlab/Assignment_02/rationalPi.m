function [ pBest, qBest, err_pq ] = rationalPi( d )
clc

% Program attempts to find the closest possible fraction to pi.
% It ends when the error (absolute value of the current fraction 
% minus pi) is less than the given tolerance (d).


% Initializations
pBest = 1;                      % Best numerator found so far
qBest = 1;                      % Best denominator found so far
err_pq = abs(pBest/qBest - pi); % Error in current best fraction

% Check out all possible numerators.  Swaps between finding
% numerators and denominators until error tolerances are satisfied.
while abs((pBest/qBest)-pi) > 10^(-1*d)
        % Initializations for the p-search...
        
        q0 = 1;
        e0 = abs(pi - pBest/q0);
        % For this p, find the best denominator
        
        for q=1:pBest
            if abs(pi - pBest/q) < e0
                % A new best denominator has been found for this p
                q0 = q;
                e0 = abs(pi - pBest/q);            
            end            
        end
        % Check to see if we have a new best quotient
        if  e0 < err_pq
            qBest = q0;
            err_pq = e0;
        else 
            pBest = pBest + 1;   
        end
end
