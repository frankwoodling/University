function T_out = T_convertor_switch(T,u1,u2)

% Function takes two T_outerature scales and the initial value
% It then converts initial T_outerature to the T_outerature in a different scale
% u1 = initial T_outerature scale
% u2 = scale to be converted to
% T = initial T_outerature value



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

% Takes the initial temperature scale variable and finds which statement
% to run. After finding the initial scale it will use u2 (the temperature
% scale to convert to, and find the converted value.
switch u1
    case {'C'}
        switch u2
            case {'F'}
                T_out = (T*(9/5))+32;
            case {'R'}
                T_out = (T+273.15)*(9/5);
            case {'K'}
                T_out = (T+273.15);
            case {'C'}
                T_out = T;
        end
% For the case that the orginial temperature is in Fahrenheit.        
    case {'F'}
        switch u2
            case {'C'}
                T_out = (T-32)*(5/9);
            case {'R'}
                T_out = (T+459.67);
            case {'K'}
                T_out = ((T+459.67)*(5/9));
            case {'F'}
                T_out = T;
        end
% For the case that the orginial temperature is in Rankine.         
    case {'R'}
        switch u2
            case {'C'}
                T_out = (T-491.67)*(5/9);
            case {'K'}
                T_out = T*(5/9);
            case {'F'}
                T_out = T-459.67;
            case {'R'}
                T_out = T;
        end
% For the case that the orginial temperature is in Kelvin.         
    case {'K'}
        switch u2
            case {'C'}
                T_out = T-273.15;
            case {'F'}
                T_out = (T*(9/5))-459.67;
            case {'R'}
                T_out = T*(9/5);
            case {'K'}
                T_out = T;
        end
                              
        
end
end
                
        
                
                
              
    
      