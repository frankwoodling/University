function vk = findSubstrings(S1,S2)
%Find the occurences of string S1 in string S2.
%If S1 is a substring of S2 then vk is the vector positions
%of the first matching character of the matches of S1 in S2.
%If S1 is not a substring of S2, then vk is zero.

vk = [];

for i = 1:length(S2)-1
    if strcmp(S1,S2(i:i+1)) == 1
        vk = [vk i];
    end
end
end