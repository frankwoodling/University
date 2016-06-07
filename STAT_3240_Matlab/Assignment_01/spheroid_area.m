function [A,approx] = spheroid_area(r1,r2)
    

    % Find gamma to plug into equation
    x = acos(r2/r1); 
    
    
    % Exact equation for area of oblate spheroid
    A = 2*pi*(r1^2+((r2^2/sin(x))*log((1+sin(x))/cos(x)))); 
    
    % Approximation for the area of oblate spheroid
    approx = 4*pi*((r1+r2)/2)^2; 

end


