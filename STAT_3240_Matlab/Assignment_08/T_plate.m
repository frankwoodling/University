function tau = T_plate(x,y)
% tau is temperature at (x,y)
tau = 100*exp(-.4*(  (x-1)^2 + 0.7*(y-3)^2)) + ...
      80*exp(-.2*(2*(x-5)^2 + 1.5*(y-1)^2));
end