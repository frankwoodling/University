function data_out= frozenSensor(sensor_data,thresholds)
% The function frozenSensor determines if a given set of
% wind, temperature, and humidity measurements are unreliable
% based on a set of conditions and removes them from the original
% data set.
%
% sensor_data = matrix of sensor measurements
% thresholds = vector of thresholds for sensor measurements
% data_out = Cell array containing the new data set matrix and
% and the discarded data matrix.

% finds rows that meet given threshholds
row_index = find(sensor_data(:,1) <= thresholds(1,1) & ...
                 sensor_data(:,2) <= thresholds(1,2) & ...
                 sensor_data(:,3) >= thresholds(1,3));
 
%  creates an array of removed entries          
discarded_data = sensor_data(row_index,:);

% creates an array of vectors that did not meet threshholds
sensor_data(row_index,:) = [];

% combines the two vectors, with the discarded entries at the bottom
data_out = {sensor_data; discarded_data};

end