function [ estBias, estRmse, ntrialVec ] = p02MeasurePi( ntrials, csvfile, r, plotsOn )
% Function finds the average basal area of a forest.  This function uses 
% a measure Pi method to find the average area.  If a sample overlaps the 
% boundaries we use an overlap function to find how much area is inside the
% plot.


% Read tree data from csv.
data = csvread('trees.csv', 1, 0);
[m n] = size(data);

% Create variables for the coordinates of trees along with their basal area
ba = data(1:m,3); % basal area
x = data(1:m,5); % x coordinates
y = data(1:m,6); % y coordinates
 
% Preallocate vectors
ntrialVec = ntrials/50:ntrials/50:ntrials;
estRmse = zeros(1,50);
estBias = zeros(1,50);
ba_2 = [];

% Initialize variables
A = 750^2; % total area of the plot stand
t = sum(ba); % total basal area of trees inside plot stand
step = ntrials/50; % decides how many plot points to take, 50 in this case

% Finds the area of overlap for each tree in the data set and divides by 
% the total area of the stand
for i = 1:length(ba)
    ba_2 = [ba_2 overlapArea(x(i),y(i),r)/A];
end
ba_2 = ba_2';

% Picks a random spot within the stand as a sample.  It then counts the
% basal area of the trees inside the sample and divides by the percentage
% of area for those trees.
for i = 1:ntrials
    h = (750)*rand(); 
    k = (750)*rand(); 

    trees_inside = ((x-h).^2+(y-k).^2) < r^2;

    t_hat(i) = sum(ba(trees_inside)./ba_2(trees_inside));
    
end

% Given a vector of t_hats this will compute the estimated bias and root
% square error
for j = 1:length(estBias)
    estBias(j) = 100 * ((mean(t_hat(1:(j*step))) - t)/t);
    estRmse(j) = 100 * (sqrt(var(t_hat(1:(j*step))))/t);
end

% Plotting options.  There is a plot for Rmse and Bias.
plotsOn = 'off';
if strcmp(plotsOn,'on') == 1
    
    % Plot of percentage bias vs number of trials
    plot(ntrialVec,estBias, '-*')
    title('Percentage Bias of TBA Estimate Using Masuyamas Method; ntrials = 1e+05, r=37')
    xlabel('Number of Trials')
    ylabel('Percentage Bias of Estimate')
    grid on
%     saveas(gcf, 'p02_Bias.pdf')
    
%     % Plot of Rmse vs number of trials
%     plot(ntrialVec,estRmse, '-*')
%     title('Percentage RMSE of TBA Estimate Using Masuyamas Method; ntrials = 1e+05, r=37')
%     xlabel('Number of Trials')
%     ylabel('Percentage Bias of Estimate')
%     grid on
%     %saveas(gcf, 'p02_Rmse.pdf')
end
end