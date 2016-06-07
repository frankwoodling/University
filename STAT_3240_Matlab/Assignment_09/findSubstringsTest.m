%%
disp('findSubstringsTest1')
s2='abc 123xyzlmn3xypqr_bc lm';
s1='bc';
vk_cor=[2 21];
[vk]=findSubstrings(s1,s2);
assert( all(vk==vk_cor)  , ...
    [ '\nYour output \nvk = [' sprintf(' %d ',vk)  ']\n\n' ...
      'Expected output \nvk_cor = [' sprintf(' %d ',vk_cor)  ']\n' ], ...
      vk,vk_cor);
%%
disp('findSubstringsTest2')
s2='abc 123xyzlmn3xypqr_bc lm';
s1='c ';
vk_cor=[3 22];
[vk]=findSubstrings(s1,s2);
assert( all(vk==vk_cor)  , ...
    [ '\nYour output \nvk = [' sprintf(' %d ',vk)  ']\n\n' ...
      'Expected output \nvk_cor = [' sprintf(' %d ',vk_cor)  ']\n' ], ...
      vk,vk_cor);
%%
disp('findSubstringsTest3')
s2='abc 123xyzlmn3xypqr_bc lm';
s1='c 3';
vk_cor=[0];
[vk]=findSubstrings(s1,s2);
assert( all(vk==vk_cor)  , ...
    [ '\nYour output \nvk = [' sprintf(' %d ',vk)  ']\n\n' ...
      'Expected output \nvk_cor = [' sprintf(' %d ',vk_cor)  ']\n' ], ...
      vk,vk_cor);
%%
disp('findSubstringsTest4')
s2='abc 123xyzlmn3xypqr_bc lm';
s1='lm';
vk_cor=[11 24];
[vk]=findSubstrings(s1,s2);
assert( all(vk==vk_cor)  , ...
    [ '\nYour output \nvk = [' sprintf(' %d ',vk)  ']\n\n' ...
      'Expected output \nvk_cor = [' sprintf(' %d ',vk_cor)  ']\n' ], ...
      vk,vk_cor);
