function [ntrialWins, ntrialVec]=montyHall(ntrials,decideSwitch,plotsOn)
% Purpose of function is to simulate the Monty Hall problem with different
% strategys.
% ntrials is the number of times the function chooseDoor function will run.
% decideSwitch may be 'always', 'never', 'flip', or 'whyNot'
% plotsOn will plot a cumulative distribution of trials if equal to 'yes'


% Prepopulate vectors
% ntrialWins is a vector of cumulative probabilities of winning
% ntrialVec is a vector with the trial number
% winVec is a vector of all 1s and 0s with one for each trial.  A 1
% indicates a win in an iteration while a zero is a loss.
ntrialWins = zeros(1,ntrials);
ntrialVec = linspace(1,ntrials,ntrials);

%doors = [1, 2, 3];

always = @() 1;
never = @() 0;
flip = @() rand();
whyNot = @() randn()+1.5;

wins = 0;
% Always switch doors

for k = 1:ntrials
    if decideSwitch() >= 0.5
        switch_door = 1;
    else
        switch_door= 0;
    end
    
    door = randi(3);
    %win = @(always) chooseDoor(always, switch_door);
    %wins(k) = win(door);
    %ntrialWins(k) = mean(wins(1:k)); 
    if chooseDoor(door, switch_door) == 1;
        wins = wins + 1;
    end
    
    ntrialWins(k) = wins/k;
end
    

% Plots the cumulative probability vector as the y-axis and the trial
% number as the x-axis.  It will only plot a total of 50 points selected
% evenly from the ntrialWins vector.

if strcmp('on', plotsOn)
    plotPoints = ntrials/50;
    plot_y = ntrialVec(1:plotPoints:length(ntrialVec));
    plot_x = ntrialWins(1:plotPoints:length(ntrialWins));
    
    
    %plot_var = func2str(decideSwitch);
    string = func2str(always);
    %plot_title = sprintf('Monty Hall Problem for Decision Function %d',string);
    plot_title = 'Monty Hall Problem for Decision Function whyNot';

    plot(plot_y(2:50), plot_x(2:50), '-*')
    xlabel('Number of Trials')
    ylabel('Probability of Winning')

    disp(decideSwitch)
    title(plot_title)
    grid on
    saveas(gcf, 'whyNot.pdf')
end
end


function [ win ] = chooseDoor( door, switch_door )

% door = 1, 2, 3
% switch_door = 0, 1
prize = randi(3);

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
end 


