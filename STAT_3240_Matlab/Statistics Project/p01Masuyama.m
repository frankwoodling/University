function [estBias estRmse ntrialVec] = p01Masuyama(ntrials, csvfile, r, plotsOn)
% Function uses Masuyama's method to sample the basal area of trees in a
% forest.  Each iteration it will select a random center and find the trees
% inside the sample.  It will calculate an estimate of the total basal area 
%of all the trees in the forest based on the samples.

% Read tree data from csv.
data = csvread(csvfile, 1, 0);
% data = csvread('trees.csv', 1, 0);
[m n] = size(data);

% Create variables for the coordinates of trees along with their basal area
ba = data(1:m,3); % basal area
x = data(1:m,5); % x coordinates
y = data(1:m,6); % y coordinates

% Preallocate vectors
ntrialVec = 1:ntrials/50:ntrials;
estRmse = zeros(1,50);
estBias = zeros(1,50);
t_hat = zeros(1,ntrials);

% Initialize variables
a_samp = pi*r^2; % area of each sample
a_star = (750+2*r)^2; % area of plot plus a border the size of the radius
stand_samp = a_star/a_samp; % percent of sample area
t = sum(ba); % total basal area in entire plot
step = ntrials/50; % decides how many plot points to take, 50 in this case

% Loop will find a random center point for a sample and find out which
% trees are inside.  It will then add the total basal area of the trees
% inside the sample.
for i = 1:ntrials
    h=((750+2*r)*rand())-r;
    k=((750+2*r)*rand())-r;
    
    trees_inside = ((x-h).^2+(y-k).^2) < r^2;
    t_hat(i) = stand_samp*sum(ba(trees_inside));    
end

% Given a vector of t_hats this will compute the estimated bias and root
% square error
for j = 1:length(estBias)
    estBias(j) = 100 * ((mean(t_hat(1:(j*step))) - t)/t);
    estRmse(j) = 100 * (sqrt(var(t_hat(1:(j*step))))/t);
end


plotsOn = 'off';
if strcmp(plotsOn,'on') == 1
    
    % Plot of percentage bias vs number of trials
    plot(ntrialVec,estBias, '-*')
    title('Percentage Bias of TBA Estimate Using Masuyamas Method; ntrials = 1e+05, r=37')
    xlabel('Number of Trials')
    ylabel('Percentage Bias of Estimate')
    grid on
    % saveas(gcf, 'p01_Bias.pdf')
    
%     % Plot of Rmse vs number of trials
%     plot(ntrialVec,estRmse, '-*')
%     title('Percentage RMSE of TBA Estimate Using Masuyamas Method; ntrials = 1e+05, r=37')
%     xlabel('Number of Trials')
%     ylabel('Percentage Bias of Estimate')
%     grid on
%     %saveas(gcf, 'p01_Rmse.pdf')

end