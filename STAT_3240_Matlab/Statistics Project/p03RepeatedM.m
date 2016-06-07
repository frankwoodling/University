function [ prctBias, prctRmse, ntrialVec ] = p03RepeatedM( ntrials, csvfile, r, plotsOn )
% Function takes samples of a forest and totals the basal area of the trees
% in each sample.  With the repeated Masuyama method if a sample overlaps
% the edge of the boundary another sample will be created with the area of
% the overlap.  This will continue until a plot is inside the stand with no
% overlap.

plotsOn = 'off';

% Read the tree data from csv
data = csvread('trees.csv', 1, 0);
[m n] = size(data);

% Read data file to create vectors of x and y coordinates
ba = data(1:m,3); % basal area
x = data(1:m,5); % x coordinates
y = data(1:m,6); % y coordinates

% Initialize vectors
ntrialVec = 1:ntrials/50:ntrials;
prctRmse = zeros(1,50);
prctBias = zeros(1,50);
t_hat = zeros(1,ntrials);

% Initialize variables
A = 750^2; % total area of the plot stand
t = sum(ba); % total basal area of trees inside plot stand
step = ntrials/50; % decides how many plot points to take, 50 in this case

% For plotting
count = 0;
count_vec = [];
x_vec_1 = [];
y_vec_1 = [];
x_vec_2 = [];
y_vec_2 = [];
r_vec_1 = [];
r_vec_2 = [];
countVec = zeros(1,10);

% As before loop will select a random point in the plot.  If the sample
% overlaps it will use a while loop to find smaller samples until one does
% not have overlap.
for i = 1:ntrials
    % create a second value for radius in case there is overlap
    r_new = r; 
    count = 1;
    
    % Generate a random center for each sample
    h=((750+2*r)*rand())-r;
    k=((750+2*r)*rand())-r;
    
    % create a logic vector of trees inside the sample and sum them
    trees_inside = ((x-h).^2+(y-k).^2) < r^2;
    t_hat_temp = sum(ba(trees_inside));

    % if a sample overlaps the boundary it will create a new smaller sample
    % and repeat as above with a new radius
    while overlapArea(h,k,r_new) < (pi*(r_new^2))
        area_new = abs(overlapArea(h,k,r_new)-(pi*r_new^2));
        
        r_new = sqrt(area_new/pi);
        
        h=((750+2*r_new)*rand())-r_new;
        k=((750+2*r_new)*rand())-r_new;
        
        trees_inside = ((x-h).^2+(y-k).^2) < r_new^2;
        t_hat_temp = t_hat_temp+sum(ba(trees_inside));
        
        if strcmp(plotsOn,'on') == 1
            count = count + 1;


            x_vec_1 = [x_vec_1; h];
            y_vec_1 = [y_vec_1; k];       
            r_vec_1 = [r_vec_1; r_new];
            
            if count > length(x_vec_2)
                x_vec_2 = x_vec_1;
                y_vec_2 = y_vec_1;
                r_vec_2 = r_vec_1;
            end      
        end
    end
    countVec(count) = countVec(count) + 1;  
%     if strcmp(plotsOn,'on') == 1
%         count_vec(count) = count_vec(count)+1;
%     end
t_hat(i) = (A/(pi*r^2))*t_hat_temp;  
        
end

% Given a vector of t_hats this will compute the estimated bias and root
% square error
for j = 1:length(prctBias)
    prctBias(j) = 100 * ((mean(t_hat(1:(j*step))) - t)/t);
    prctRmse(j) = 100 * (sqrt(var(t_hat(1:(j*step))))/t);
end

% Plotting options.  There is a plot for Rmse and Bias.
if strcmp(plotsOn,'on') == 1

%    % Plot of percentage bias vs number of trials
%     plot(ntrialVec,prctBias, '-*')
%     title('Percentage Bias of TBA Estimate Using Masuyamas Method; ntrials = 1e+05, r=37')
%     xlabel('Number of Trials')
%     ylabel('Percentage Bias of Estimate')
%     grid on
% %     saveas(gcf, 'p03_Bias.pdf')
    
%     % Plot of Rmse vs number of trials
%     plot(ntrialVec,prctRmse, '-*')
%     title('Percentage RMSE of TBA Estimate Using Masuyamas Method; ntrials = 1e+05, r=37')
%     xlabel('Number of Trials')
%     ylabel('Percentage Bias of Estimate')
%     grid on
%     saveas(gcf, 'p03_Rmse.pdf')

% % Plot of circles in iteration with the most samples
%     for i = 1:length(x_vec_2)
% 
%         hold on
%         th = 0:pi/50:2*pi;
%         xunit = r * cos(th) + x_vec_2(i);
%         yunit = r * sin(th) + y_vec_2(i);
%         h = plot(xunit, yunit);
% 
%         x_bot=[0,750];
%         y_bot=[0,0];
%         plot(x_bot,y_bot)
% 
%         x_left=[0,0];
%         y_left=[0,750];
%         plot(x_left,y_left)
% 
%         x_top=[0,750];
%         y_top=[750,750];
%         plot(x_top,y_top)
% 
%         x_right=[750,750];
%         y_right=[0,750];
%         plot(x_right,y_right)
% 
%         hold off    
%         saveas(gcf, 'p03_most_circles.pdf')
%     end

bar(countVec)
title('Number of Samples Versus Number of Plots Using Repeated Masuyamas Method; ntrials = 1e+05, r=37')
xlabel('Number of Plots per Sample')
ylabel('Number of Samples')
grid on
% saveas(gcf, 'p03_bar.pdf')
end
