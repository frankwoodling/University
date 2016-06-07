function [ win ] = chooseDoor( door, switch_door )

% Function takes a chosen door and their decision to switch or not.  It
% finds out if they won or not given a random prize door.  Wins are
% returned as a 1, and losses are returned as a 0.
prize = datasample([1,2,3],1);

% Selected first door
if door == 1 && prize == 1
    if switch_door == 1
        win = 0;
    else win = 1;
    end
end
    
if door == 1 && prize == 2
    if switch_door == 1 
        win = 1;
    else
        win = 0;
    end
end

if door == 1 && prize == 3
    if switch_door == 1
        win = 1;
    else
        win = 0;
    end
end

% Selected second door
if door == 2 && prize == 1
    if switch_door == 1
        win = 1;
    else
        win = 0;
    end
end

if door == 2 && prize == 2
    if switch_door == 1
        win = 0;
    else
        win = 1;
    end
end

if door == 2 && prize == 3
    if switch_door == 1
        win = 1;
    else
        win = 0;
    end
end

% Selected third door
if door == 3 && prize == 1
    if switch_door == 1
        win = 1;
    else
        win = 0;
    end
end

if door == 3 && prize == 2
    if switch_door == 1 
        win = 1;
    else
        win = 0;
    end
end

if door == 3 && prize == 3
    if switch_door == 1
        win = 0;
    else
        win = 1;
    end
end

disp(win)    
end 
