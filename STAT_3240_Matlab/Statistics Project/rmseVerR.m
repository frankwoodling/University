function [] = rmseVerR(ntrials, tbamethod)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 
rVec = 5:5:50;
csvfile = 'trees.csv';
r = 5;

for i = 1:10    
    [Bias,Rmse] = tbamethod(ntrials, csvfile, r, 'off');
    prctRmse(i) = Rmse(50);
    r = r + 5; 
end

%Formatting
plot(rVec, prctRmse,'*-b');

xlabel ('Plot Radius')
ylabel ('Percentage RMSE of Estimate')
grid on


% title('Percentage RMSE of TBA Estimate Using Masuyamas Method; ntrials = 1e+05')
% % saveas(gca,'p01_rmseVerR.pdf')
    

% title('Percentage RMSE of TBA Estimate Using Measure Pi Method; ntrials = 1e+05')
% % saveas(gca,'p02_rmseVerR.pdf')


title('Percentage RMSE of TBA Estimate Using Repeated Masuyamas Method; ntrials = 1e+05')
% saveas(gca,'p03_rmseVerR.pdf')

end