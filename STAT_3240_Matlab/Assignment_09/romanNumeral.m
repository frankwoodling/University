function y = romanNumeral(x)
% Function takes an integer x as an input and returns the number as a Roman
% numeral

% x is an integer 0 <= x <= 3999
% y is the Roman numeral equivalent to x
y = {};

% Loop finds a ones, tens, hundreds, and thousands integer that is equal to
% the inputted integer.  It then concatenates the Roman numeral for each
% separate number.
if x < 4000
    for a = 0:3
        for b = 0:9
            for c = 0:9
                for d = 0:9
                    n = a*1000 + b*100 + c*10 + d;
                    if n==x && n>0
                        y{n} = [Thou2R(a) Hund2R(b)...
                                Tens2R(c) Ones2R(d)];
                    end
                end
            end
        end
    end
y = y(length(y));
else
    y = ''; 
end
end

% Computes the numeral for the ones value of x.
function r = Ones2R(x)
    
    ones = {'I', 'II', 'III', 'IV', ...
            'V', 'VI','VII', 'VIII', 'IX'};

     if x==0
         r = '';
         else
         r = ones{x};
     end
end

% Computes the numeral for the tens value of x.
function r = Tens2R(x)
    
    tens = {'X', 'XX', 'XXX', 'XL', 'L', ...
            'LX', 'LXX', 'LXXX', 'XC'};
             
    if x==0
        r = '';
        else
        r = tens{x};
    end
end

% Computes the numeral for the hundreds value of x.
function r = Hund2R(x)
    
    hundreds = {'C', 'CC', 'CCC', 'CD', ...
                'D', 'DC', 'DCC', 'DCCC', 'CM'};
    
    if x==0
        r = '';
        else
        r = hundreds{x};
    end
end

% Computes the numeral for the thousands value of x.  This number cannot
% exceed 3999.
function r = Thou2R(x)
    
    thousands = {'M', 'MM', 'MMM'};
    
    if x==0
        r = '';
        else
        r = thousands{x};
    end
end
       