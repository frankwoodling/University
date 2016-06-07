function y = stationary(P,x0,tol,itMax)
% Function takes a probability matrix (where all columns sum to 1) and
% multiplies a state vector by it.  For each iteration the previous state
% vector is used.  When the difference between state vectors meets a given
% tolerance the loop ends.
% P is a probability vector
% x0 is the inital state vector
% tol is tolerence
% itMax is the maximum number of iterations

% mSteps and plotsOn are for plotting purposes
% If plotsOn = 'on' it will plot each state vector against the number of
% Markov steps (calculated using mSteps).
x = x0;
mSteps = 0;
plotsOn = 'off';

if strcmp('on', plotsOn)
    l_1 = x(1);
    l_2 = x(2);
    l_3 = x(3);
    l_4 = x(4);
end 

% Iterates until tolerance or a maximum number of iterations is reached
while sum(abs((P*x)-x)) > tol 
    for e = 1:itMax
        x = P*x;
        
        % It plot='on' this will create a vector for each line.  I know
        % this isn't optimal.  I could figure out how to create a matrix of
        % vectors, but not how to graph only each row.
        if strcmp('on', plotsOn)
            mSteps = mSteps + 1;
            l_1 = [l_1 x(1)];
            l_2 = [l_2 x(2)];
            l_3 = [l_3 x(3)];
            l_4 = [l_4 x(4)];
        end
    end
end
% y is the final state matrix
y = x;

% Intitializes mSteps, the total number of Markov Steps
mSteps = linspace(1,mSteps,mSteps);

% for plotting
if strcmp('on', plotsOn)
    plot_title = 'Evolution of Markov Chain Stationary Vector';

    plot(mSteps(1:10), l_1(1:10), '-*',...
        mSteps(1:10), l_2(1:10), '-*',...
        mSteps(1:10), l_3(1:10), '-*',...
        mSteps(1:10), l_4(1:10), '-*')

    xlabel('Markov Steps')
    ylabel('State Vector Elements')

    title(plot_title)
    grid on
    %saveas(gcf, 'stationary2.pdf')
end
end