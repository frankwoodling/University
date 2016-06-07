function tau = T_plate1(x,y,hs)

tau = 100*exp(-.4*(  (x-hs(1,1)).^2 + 0.7*(y-hs(1,2)).^2)) + ...
      80*exp(-.2*(2*(x-hs(2,1)).^2 + 1.5*(y-hs(2,2)).^2));

end