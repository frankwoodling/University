function T_out = T_convertor_if(T,u1,u2)

% Function takes two temperature scales and the initial value
% It then converts initial temperature to the temperature in a different scale
% u1 = initial temperature scale
% u2 = converted temperature scale
% T = initial temperature value



% Possible combinations
% C to F, C to R, C to C, C to K
% F to C, F to F, F to R, F to K
% R to C, R to F, R to R, R to K
% K to C, K to F, K to R, K to K
% 
% C = Celsius
% F = Fahrenheit
% R = Rankine
% K = Kelvin

% If the original temperature scale is Celsius this if statement
% finds the scale that you want to convert to.  It then runs
% the input figures through an equation giving a converted temperature
% value.
if u1 == 'C'
    if u2 == 'F'
        T_out = (T*(9/5)+32);
    elseif u2 == 'R'
        T_out = (T+273.15)*(9/5);
    elseif u2 == 'C'
        T_out = T;
    elseif u2 == 'K'
        T_out = (T+273.15);
    end
    
% If Celsius is not the original temperature scale the function
% continues to this if statement.  If the scale is Fahrenheit it converts
% the temperature to the chosen scale.
elseif u1 == 'F'
    if u2 == 'C'
        T_out = (T-32)*(5/9);
    elseif u2 == 'F'
        T_out = T;
    elseif u2 == 'R'
        T_out = T+459.67;
    elseif u2 == 'K'
        T_out = (T+459.67)*(5/9);
    end
% For converting temperatures with a starting temperature scale of Rankine.       
elseif u1 == 'R'
    if u2 == 'C'
        T_out = (T-491.67)*(5/9);
    elseif u2 == 'F'
        T_out = (T-459.67);
    elseif u2 == 'R'
        T_out = T;
    elseif u2 == 'K'
        T_out = T*(5/9);
    end
% For converting temperatures with a starting temperature scale of Kelvin.        
elseif u1 == 'K'
    if u2 == 'C'
        T_out = T-273.15;
    elseif u2 == 'F'
        T_out = (T*(9/5))-459.67;
    elseif u2 == 'R'
        T_out = T*(9/5);
    elseif u2 == 'K'
        T_out = T;
    end
        
T_out = T_out;  
disp T_out;
end 
end

