function [area]=overlapArea(x,y,r)
% Function takes a circle with given coordinates and radius and finds out
% if the edge of the circle overlaps the boundaries of a 750x750 tree
% stand.  The function will then return the area inside the tree stand.

area_edge = @(r,h) r^2*acos((r-h)/r)-(r-h)*sqrt(2*r*h-h^2);
area_corner_top = @(x_1,y_1) (1/2)*x_1*(750-y_1);
midpoint = @(x1,x2,y1,y2) [(x1+x2)/2 (y1+y2)/2];
distance = @(x1,x2,y1,y2) sqrt((x1-x2).^2+(y1-y2).^2);

area=0;

% interior to all boundaries
if x > (0+r) && x < (750-r) && y > (0+r) && y < (750-r)
     %disp('interior to all boundaries')
    area = pi*r^2;

% lower left corner inside
elseif distance(x,0,y,0) < r
    %disp('lower left corner inside')
    x_1 = sqrt(r^2-y^2)+x;
    y_1 = sqrt(r^2-x^2)+y;

    mid = midpoint(x_1,0,y_1,0);
    h = r-distance(mid(1),x,mid(2),y);

    area_1 = 0.5*(x_1-0)*(y_1);
    area_2 = area_edge(r,h);
    area = area_1+area_2;

% lower left corner outside   
elseif distance(x,0,y,0) > r && (x-r) < 0 && (y-r) < 0 && (x-r) > -r && (y-r) > -r 
    %disp('lower left corner outside ')
    h_bot = 0-(x-r);
    h_left = 0-(y-r);
    area = pi*r^2-(area_edge(r, h_bot)+area_edge(r, h_left)); 
    
% lower right corner inside
elseif distance(x,750,y,0) < r
    %disp('lower right corner inside')
    x_1 = sqrt(r^2-y^2);
    x_coord=x-x_1;

    y_1 = sqrt(r^2-(750-x)^2);
    y_coord = y+y_1;

    mid = [(x_coord+750)/2 (y_coord+0)/2];

    h= r-sqrt((mid(1)-x)^2+(mid(2)-y)^2);

    area_1 = .5*(750-x_coord)*y_coord;
    area_2 = area_edge(r,h);
    area = area_1+area_2;
    
% lower right corner outside
elseif distance(x,0,y,0) > r && (x+r) > 750 && (y-r) < 0 && (x+r) < (750+r)
    %disp('lower right corner outside')
    h_right = x+r-750;
    h_bot = 0-(y-r);
    area = pi*r^2-(area_edge(r, h_right)+area_edge(r, h_bot));

% upper right corner inside
elseif distance(x,750,y,750) < r
    %disp('upper right corner inside')
    x_1 = x-sqrt(r^2-y^2+2*y*750-750^2);
    y_1 = y-sqrt(r^2-x^2+2*x*750-750^2);

    mid = midpoint(x_1,750,y_1,750);

    h= r-sqrt((mid(1)-x)^2+(mid(2)-y)^2);

    area_1 = .5*(750-x_1)*(750-y_1);
    area_2 = area_edge(r,h);
    area = area_1+area_2;
    
% upper right corner outside
elseif distance(x,750,y,750) > r && (x+r) > 750 && (y+r) > 750 && (x+r) < (750+r) && (y+r) < (750+r)
     %disp('upper right corner outside')
     h_top = (y+r)-750;
    h_right = (x+r)-750;
    area = pi*r^2-(area_edge(r, h_top)+area_edge(r, h_right));
   
% upper left corner inside
elseif distance(x,0,y,750) < r
     %disp('upper left corner inside')
    % find x_1 and y_1 with circle equation
    % (x_1-x)^2+(y_1-y)^2=r^2
    x_1 = sqrt(r^2-(750-y)^2)+x;
    y_1 = -sqrt(r^2-(0-x)^2)+y;

    % find the midpoint of (x_1,750) and (0,y_1)
    midpoint = [(x_1+0)/2 (y_1+750)/2];

    % find the length of h.  It is the distance between the circle's
    % centerpoint and the midpoint
    h = r-sqrt((x-midpoint(1))^2+(y-midpoint(2))^2);

    % find the area of each section
    % area 1:(1/2)*x_1*(750-y)
    % area 2: r^2*acos((r-h)/r)-(r-h)*sqrt(2*r*h-h^2)

    area_1 = area_corner_top(x_1,y_1);
    area_2 = area_edge(r,h);
    area = area_1 + area_2;
    
% upper left corner outside 
elseif distance(x,0,y,750) > r && (x-r) < 0 && (y+r) > 750 && (x-r) > -r && (y+r) < (750+r)
     %disp('upper left corner outside')
    h_left = r-x;
    h_top = r-(750-y);
    area = pi*r^2-(area_edge(r, h_left)+area_edge(r, h_top));
    
% left of left side
elseif x < 0 && x > (0-r) && y > 0 && y < 750 
     %disp('left of left side')
    h = r-abs(0-x);
    area = area_edge(r,h);
    
% right of left side
elseif x > 0 && x < (0+r) && y > (0+r) && y < (750-r)
     %disp('right of left side')
    h = r-abs(0-x);
    area = pi*r^2 - area_edge(r,h);

% left of right side
elseif x > (750-r) && x < 750 && y > (0+r) && y < (750-r)
     %disp('left of right side')
    h = r -(750-x);
    area = pi*r^2 - area_edge(r,h);

% right of right side
elseif x > 750 && x < (750+r) && y > 0 && y < (750+r) 
     %disp('right of right side')
    if (x-750)+(y-750) > r
        area=0;
    else
    h = r-abs(750-x);
    area = area_edge(r,h);
    end

% below bottom side
elseif x > 0 && x < (750-r) && y < 0 && y > (0-r)
     %disp('below bottom side')
    if (x-750)+(y-750) > r
    area=0;
    else
    h = r-(0-y);
    area = area_edge(r,h);
    end
% above bottom side
elseif x > r && x < (750-r) && y > 0 && y < (0+r)
     %%disp('above bottom side')
    h = r-(0-y);
    area = area_edge(r,h);

% below top side
elseif x > r && x < (750-r) && y > (750-r) && y < 750
     %disp('below top side')
    h = r-(750-y);
    area = pi*r^2 - area_edge(r,h);

% above top side
elseif x > 0 && x < (750-r) && y > 750 && y < (750+r)
     %disp('above top side')
    h = r-(750-y);
    area = pi*r^2 - area_edge(r,h);
   

end
end