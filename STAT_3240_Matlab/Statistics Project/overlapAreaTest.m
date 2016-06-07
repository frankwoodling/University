%%
disp('test1: left of left side')
x=-25;y=250;r=30;
[area]=overlapArea(x,y,r);
area_soln=112.5389;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
%%
disp('test2: right of left side')
x=5;y=250;r=30;
[area]=overlapArea(x,y,r);
area_soln=1.7123e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln); 
%%
disp('test3: left of right side')
x=745;y=250;r=20;
[area]=overlapArea(x,y,r);
area_soln=826.2152;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);      
%%
disp('test4: right of right side')
x=770;y=250;r=30;
[area]=overlapArea(x,y,r);
area_soln=309.7482;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in lower left corner inside\nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
%%
disp('test5: below bottom side')
x=250;y=-25;r=30;
[area]=overlapArea(x,y,r);
area_soln=112.5389;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in lower left corner inside\nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
 %%
disp('test6: above bottom side')
x=250;y=10;r=30;
[area]=overlapArea(x,y,r);
area_soln=2.0024e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in lower left corner inside\nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);    
 %%
disp('test7: below top side')
x=250;y=740;r=30;
[area]=overlapArea(x,y,r);
area_soln=2.0024e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in lower left corner inside\nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);         
 %%
disp('test8: above top side')
x=250;y=760;r=30;
[area]=overlapArea(x,y,r);
area_soln=825.0208;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in lower left corner inside\nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);           
%%
disp('test9: lower left corner outside')
x=27;y=27;r=30;
[area]=overlapArea(x,y,r);
area_soln=2.7217e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
%%
disp('test10: lower left corner inside')
x=10;y=10;r=30;
[area]=overlapArea(x,y,r);
area_soln=  1.3956e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
 %%
disp('test11: lower right corner outside')
x=725;y=25;r=30;
[area]=overlapArea(x,y,r);
area_soln=  2.6024e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);              
%%
disp('test12: lower right corner inside')
x=745;y=5;r=30;
[area]=overlapArea(x,y,r);
area_soln=  1.0305e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
%%
disp('test13: upper right corner outside')
x=725;y=725;r=30;
[area]=overlapArea(x,y,r);
area_soln=  2.6024e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
%%
disp('test14: upper right corner inside')
x=751;y=751;r=30;
[area]=overlapArea(x,y,r);
area_soln=   647.8695;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
%%
disp('test15: upper left corner outside')
x=25;y=725;r=30;
[area]=overlapArea(x,y,r);
area_soln=    2.6024e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
%%
disp('test16: upper left corner inside')
x=-2;y=752;r=30;
[area]=overlapArea(x,y,r);
area_soln=    590.9473;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);
%%
disp('test17: interior to all boundaries')
x=250;y=250;r=30;
[area]=overlapArea(x,y,r);
area_soln=      2.8274e+03;
tol1=2e-1;
assert( abs(area-area_soln) < tol1 ,  ...
    [ '\nError in \nYour output \nArea = [' sprintf(' %5.3f ',area) ']\n' ...
        'Expected output \nArea = [' sprintf(' %5.3f ',area_soln) ']\n'], ...
         area,area_soln);     
                                                                    
                               
                                                                    
                             
                        
     
