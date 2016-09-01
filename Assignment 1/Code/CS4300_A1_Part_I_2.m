function res = CS4300_A1_Part_I_2(num_of_boards)
% CS4300_A1_Part_I_2 - This will generate a number of boards for each step in the interval of 0-14 pits
% On Input:
%   num_of_boards (int): The number of boards to generates
% On Output:
%   res (15 X 3 array): The first index (the row) is equal to the number of pits + 1. The first column is the number of solvable boards. The second column is the
%   variance. The third column is the confidence interval.
% Call:
%   res = CS4300_A1_Part_I_2(5000);
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016
res = zeros(15, 3);

% get the number of solvable boards
for pits = 0:14
    res(pits + 1, 1) = CS4300_A1_Part_I_1(num_of_boards, pits);
end



end