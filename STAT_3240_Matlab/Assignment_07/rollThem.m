function [ntrialMatch, ntrialVec ]=rollThem(ntrials,diePattern,plotsOn);
% Purpose of function is to roll three dice, and decide whether the
% combination of dice matches the given pattern.
% diePattern patterns include:
% pattern1: probability that two dice are the same value
% pattern2: probability third dice roll is between the values of the first
%           two rolls
% pattern3: probability the third dice roll is >= or <= the first two rolls
% ntrials: number of trials
% plotsOn: if set to 'on' it will plot the results
% Function returns a cumulative probability vector and a vector with trial
% numbers

% Initializes vectors
% patternMatch keeps track of the number of successful trials
ntrialMatch = zeros(1,ntrials);
ntrialVec = 1:ntrials;
patternMatch = 0;

% Runs ntrials; each with a random roll while recalculating the cumulative
% probability each iteration.
for k = 1:ntrials
    combo = randi(6, 1, 3);
    
    if diePattern(combo) == 1
        patternMatch = patternMatch + 1;
    end
       
    ntrialMatch(k) = patternMatch/k;
end

% Plot cumulative probabilty vs the number of trials.
if strcmp('on', plotsOn)
    plotPoints = ntrials/50;
    plot_y = ntrialVec(1:plotPoints:length(ntrialVec));
    plot_x = ntrialMatch(1:plotPoints:length(ntrialMatch));
    
    
    % I cannot figure out why func2str will not work properly.  It either
    % repeats the title infinitely, does nothing, or prints a number.
    
    %patternString = func2str(diePattern);
    %plot_title = ([title patternString]);
    %plot_title = sprintf('Three-dice Probabilities for Pattern Function %d', string);

    plot(plot_y(2:50), plot_x(2:50), '-*')
    xlabel('Number of Trials')
    ylabel('Probability of roll Pattern')

    title('Monty Hall Problem for Decision Function pattern3');
    grid on
    %saveas(gcf, 'pattern3.pdf')
end
end

