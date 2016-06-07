function [arrayOut]=arraySmooth(arrayIn,n,plotsOn)
% Function takes an array and outputs a new array with each point being the
% average of layers of surrounding points.
% arrayIn is the original array
% n determines the size of the filter
% plotsOn plots if equal to 'on'


% Creates a filter matrix
filter_size = 2*n+1;
filter_val = 1/filter_size.^2;
filter(1:filter_size, 1:filter_size) = filter_val;

% Creates a new matrix from arrayIn that includes padding with a reflection
% of the original array
arrayOut = arrayBoundary(arrayIn,n);
arrayOut_temp = arrayOut;

[h,k] = size(arrayOut);

% Loop will index through and create a new matrix with a moving average of
% surrounding values.
for i=1+n:h-n
    for j=1+n:k-n
        arrayOut_temp(i,j) = sum(sum(arrayOut(i-n:i+n, j-n:j+n).*filter));
    end
end
arrayOut = arrayOut_temp(1+n:h-n,1+n:k-n);

% Plotting options.
if strcmp(plotsOn,'on') == 1
    x = linspace(1,60,60);
    y = linspace(1,60,60);
    [X, Y, Z] = peaks(60);
    
    surf(x,y,Z)
    xlabel = 'x';
    ylabel = 'y';
%     saveas(gcf,smoothedArray.pdf)
    
% Plots original graph before smoothing or noise is added.
%     surf(x,y,Z)
%     title('Surface Plot of Peaks Function')
%     xlabel = 'x';
%     ylabel = 'y';
%     saveas(gcf,'peaks.pdf')    
    
% Plots first noisy graph.
%     Z_noise = arrayNoise(Z,'normal',1,plotsOn);
%     surf(x,y,Z_noise)
%     title('Surface plot of arrayIn with normal noise distribution and gain = 1')
%     xlabel = 'x';
%     ylabel = 'y';
%     saveas(gcf,'noisyArray1.pdf')

% Plots second noisy graph.
%     Z_noise = arrayNoise(Z,'uniform',2,plotsOn);
%     surf(x,y,Z_noise)
%     title('Surface plot of arrayIn with uniform noise distribution and gain = 2')
%     xlabel = 'x';
%     ylabel = 'y';
%     saveas(gcf,'noisyArray2.pdf')

end
end


function [arrayOut]=arrayBoundary(arrayIn,n)
% Purpose of function is to take a data array, add n padding, and reflect 
% the original array into the new widened array.

% Determines the number of rows and columns of the orginal array.
[in_row_n,in_col_n] = size(arrayIn);

% Prepopulates an array that includes the original array in the center
% surrounded by n rows and columns of zeros.
zeroRows = zeros(n,in_col_n);
zeroCols = zeros(length(arrayIn)+n*2,n);
arrayOut = [zeroRows;arrayIn;zeroRows];
arrayOut = [zeroCols arrayOut zeroCols];

% Determines the number of rows and columns of the orginal array
[out_row_n, out_col_n] = size(arrayOut);

% For each side of the new array the function will copy and insert a
% reflection of the original array. 
arrayOut(:,1:n)=arrayOut(:,(n+1+n):-1:(n+2)); % Left side
arrayOut(:,out_col_n-n+1:out_col_n)=arrayOut(:,out_col_n-n-1:-1:out_col_n-n-n); % Right side
arrayOut(1:n,:)=arrayOut(n+n+1:-1:n+2,:); % Top side
arrayOut(out_row_n-n+1:out_row_n,:)=arrayOut(out_row_n-n-1:-1:out_row_n-n-n,:); % Bottom side

end