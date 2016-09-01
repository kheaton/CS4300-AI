function res = CS4300_A1_Part_I_2(num_of_boards)
% CS4300_A1_Part_I_2 - This will generate a number of boards for each step in the interval of 0-14 pits
% On Input:
%   num_of_boards (int): The number of boards to generates
% On Output:
%   res (1 X 15 array): Each index in the array is the number of pits + 1, the value is how many were solvable
% Call:
%   res = CS4300_A1_Part_I_2(5000);
% Author:
%   Braden Scothern
%   UU
%   Fall 2016
res = zeros(15, 1);
for pits = 0:14
    res(pits + 1) = CS4300_A1_Part_I_1(num_of_boards, pits);
end

end