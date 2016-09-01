function [mean, var, confidence] = CS4300_A1_Part_I_2(num_of_boards)
% CS4300_A1_Part_I_2 - This will generate a number of boards for each step in the interval of 0-14 pits and calculate the mean, var, and 95%
%   confidence interval
% On Input:
%   num_of_boards (int): The number of boards to generates
% On Output:
%   mean        (Float): The mean number of solvable boards
%   var         (Float): The variance of solvable boards
%   confidence  (Float): The 95% confidence interval for the data
% Call:
%   [res, var, confidence] = CS4300_A1_Part_I_2(10000);
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016
res = zeros(15, 1);

% get the number of solvable boards
for pits = 0:14
    res(pits + 1, 1) = CS4300_A1_Part_I_1(num_of_boards, pits);
end

% calculate mean
mean = 0.0;
for i = 1:15
    mean = mean + res(i, 1);
end
mean = mean / 15.0;

% calculate varaince
var = 0.0;
for i = 1:15
    tmp = res(i, 1) - mean;
    var = var + (tmp * tmp);
end
var = var / 15.0;

% calculate confidence
confidence = 0.0;

end