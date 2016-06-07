function [arrayOut]=arrayNoise(arrayIn,noise,gain,plotsOn)
% Purpose of function is to take an array and add some amount of noise to
% each element.  The ammount of noise depends on the amount of gain and the
% distribution that the noise is determined by.

% arrayIn is the initial array
% noise can be 'uniform' or 'normal' to get random ammounts of noise from
% either a uniform or normal distribution respectively
% gain is an integer than scales the amount of noise
% plotsOn = 'on'
[h k] = size(arrayIn);

% Computes an array of random values for the given distribution.
if strcmp('uniform', noise) == 1
    r = rand(h,k)-.5;
else
    r = normrnd(0,1,[h,k]);
end

% Multiplies the array of random values by the given gain value.
arrayOut = arrayIn + gain*r;

if strcmp(plotsOn, 'on') == 1
    x = linspace(1,60,60);
    y = linspace(1,60,60);
    [X, Y, Z] = peaks(60);
    
    surf(x,y,Z)
    xlabel = 'x';
    ylabel = 'y';
end
end