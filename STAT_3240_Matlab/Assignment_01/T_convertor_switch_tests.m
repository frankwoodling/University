%%
T = 100;
u1 = 'C';
u2 = 'F';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-212) < eps)
%%
T = 100;
u1 = 'C';
u2 = 'R';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-671.67) < eps)
%%
T = 100;
u1 = 'C';
u2 = 'C';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-100) < eps)
%%
T = 100;
u1 = 'C';
u2 = 'K';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-373.15) < eps)
%%
T = 100;
u1 = 'K';
u2 = 'F';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-(-279.67)) < eps)
%%
T = 100;
u1 = 'K';
u2 = 'R';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-180) < eps)
%%
T = 100;
u1 = 'K';
u2 = 'C';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-(-173.15)) < eps)
%%
T = 100;
u1 = 'K';
u2 = 'K';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-100) < eps)
%%
T = 100;
u1 = 'F';
u2 = 'F';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-100) < eps)
%%
T = 100;
u1 = 'F';
u2 = 'R';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-559.67) < eps)
%%
T = 100;
u1 = 'F';
u2 = 'C';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-37.7777778) < eps)
%%
T = 100;
u1 = 'F';
u2 = 'K';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-310.9277778) < eps)
%%
T = 100;
u1 = 'R';
u2 = 'F';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-(-359.67)) < eps)
%%
T = 100;
u1 = 'R';
u2 = 'R';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-100) < eps)
%%
T = 100;
u1 = 'R';
u2 = 'C';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-(-217.5944444)) < eps)
%%
T = 100;
u1 = 'R';
u2 = 'K';
eps = 1e-4;
assert(abs(T_convertor_switch(T,u1,u2)-55.5555556) < eps)

% %%
% T = 100;
% u1 = 'x';
% u2 = 'K';
% assert(isnan(T_convertor(T,u1,u2)))
% 
% %%
% T = 100;
% u1 = 'R';
% u2 = 'C';
% 
% tic;
% for k=1:100000
% T_convertor(T,u1,u2);
% end
% timing=toc;
% 
% tic;
% for k=1:20
% bench_lu(421);
% end
% t_bench=toc;
% 
% assert(timing/t_bench < 2,'code is inefficient')
