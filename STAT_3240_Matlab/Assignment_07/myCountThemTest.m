
%%
disp('test1')
pattern1Match=96;
pattern1 = @(combo) (combo(1)==combo(2))|| (combo(1)==combo(3)) || (combo(2)==combo(3));
[patternMatch, percent ]=countThem(pattern1);
tol1=2e-2;
assert( pattern1Match==patternMatch ,  ...
    [ '\nYour output \npatternMatch = [' sprintf(' %5.3f ',patternMatch) ']\n' ...
        'Expected output \npatternMatch = [' sprintf(' %5.3f ',pattern1Match) ']\n'], ...
         patternMatch,pattern1Match);
%%
disp('test2')
pattern2Match=40;
pattern2 = @(combo) (combo(3) < combo(1) && combo(3) > combo(2)) || (combo(3) < combo(2) && combo(3) > combo(1));
[patternMatch, percent ]=countThem(pattern2);
tol1=2e-2;
assert( pattern2Match==patternMatch ,  ...
    [ '\nYour output \npatternMatch = [' sprintf(' %5.3f ',patternMatch) ']\n' ...
        'Expected output \npatternMatch = [' sprintf(' %5.3f ',pattern2Match) ']\n'], ...
         patternMatch,pattern2Match);

%%
disp('test3')
pattern3Match=176;
pattern3 = @(combo) (combo(3) >= combo(1) && combo(3) >= combo(2)) || (combo(3) <= combo(1) && combo(3) <= combo(2));
[patternMatch, percent ]=countThem(pattern3);
tol1=2e-2;
assert( pattern3Match==patternMatch ,  ...
    [ '\nYour output \npatternMatch = [' sprintf(' %5.3f ',patternMatch) ']\n' ...
        'Expected output \npatternMatch = [' sprintf(' %5.3f ',pattern3Match) ']\n'], ...
         patternMatch,pattern3Match);


     