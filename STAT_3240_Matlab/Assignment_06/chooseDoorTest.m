rng(1234);

win=zeros(1,20);
for k=1:20
    door=randi(3); % pick doors 1 through 3
    switchDoor=randi(2)-1; % switch or not
    win(k)=chooseDoor(door,switchDoor);
end

expected=[1     1     1     0     1     1     1     1     1     0  ...
1     1     1     0     1     1     0     1     1     0];

error=sum(abs(win-expected))