function [arrayOut]=arraySmooth1(arrayIn,n,plotsOn)
% Function takes an array and outputs a new array with each point being the
% average of layers of surrounding points.
% arrayIn is the original array
% n determines the size of the filter
% plotsOn plots if equal to 'on'


% Creates a filter matrix
filter_size = 2*n+1;
filter_val = 1/filter_size^2;
filter(1:filter_size, 1:filter_size) = filter_val;

% Creates a new matrix from arrayIn that includes padding with a reflection
% of the original array
arrayOut = arrayBoundary2(arrayIn,n);
arrayOut_temp = arrayOut;

arrayOut = conv2(arrayOut,filter,'valid');

% Plotting options.
if strcmp(plotsOn,'on') == 1
    x = linspace(1,60,60);
    y = linspace(1,60,60);
    [X, Y, Z] = peaks(60);
    
    surf(x,y,arrayOut)
    xlabel = 'x';
    ylabel = 'y';
%     saveas(gcf,smoothedArray.pdf)
    
% Plots original graph before smoothing or noise is added.
%     surf(x,y,Z)
%     title('Surface Plot of Peaks Function')
%     xlabel = 'x';
%     ylabel = 'y';
%     saveas(gcf,'peaks.pdf')    
    
% Plots first smoothed graph with arraySmooth1.
%     Z_noise = arrayNoise(Z,'normal',1,plotsOn);
%     Z_smooth = arraySmooth1(Z_noise,2,plotsOn);
%     surf(x,y,Z_smooth)
%     title('Surface Plot of arrayIn Smoothed with a Moving Average Filter of Width n=2')
%     xlabel = 'x';
%     ylabel = 'y';
%     saveas(gcf,'smoothArray3.pdf')

% Plots second smoothed graph with arraySmooth1
%     Z_noise = arrayNoise(Z,'uniform',2,plotsOn);
%     Z_smooth = arraySmooth1(Z_noise,2,plotsOn);
%     surf(x,y,Z_smooth)
%     title('Surface Plot of arrayIn Smoothed with a Moving Average Filter of Width n=2')
%     xlabel = 'x';
%     ylabel = 'y';
%     saveas(gcf,'smoothArray4.pdf')
    
end
end

function [ arrayOut ] = arrayBoundary2(arrayIn, n)
% Takes an array, adds n amount of rows and columns as padding and reflects
% the original array into the padding.  This function will add an extra
% layer of padding and output an array that is a reflection rather than a
% symmetric one after removing duplicate rows and columns.

% Adds n+1 padding to the inputted array.
arrayOut = padarray(arrayIn,[n+1,n+1], 'symmetric');

% Removes duplicate rows
[row, col] = size(arrayOut);
arrayOut(:,1+n) = [];
arrayOut(:,col-1-n)=[];

% Removes duplicate columns
[row2, col2] = size(arrayOut);
arrayOut(1+n,:) = [];
arrayOut(row2-n-1,:) = [];

end