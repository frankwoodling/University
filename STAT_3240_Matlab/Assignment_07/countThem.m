function [patternMatch, percent] = countThem(diePattern)

patternMatch=0;
combo = zeros(1,3);

for d1 = 1:6
    combo(1) = d1;
    for d2 = 1:6
        combo(2) = d2;
        for d3 = 1:6
            combo(3) = d3;
            if diePattern(combo) == 1
                patternMatch = patternMatch + 1;
            end
        end
    end
end
                          
percent = patternMatch/216;
end


