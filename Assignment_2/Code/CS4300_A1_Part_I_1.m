function num_of_solvable = CS4300_A1_Part_I_1(num_of_boards, num_of_pits)
% CS4300_A1_Part_I_1 - Generates random boards with a set number of pits and returns how many of them are solvable
% On Input:
%   num_of_boards   (int): The number of boards to generates
%   num_of_pits     (float): The number of pits that falls in the range 0 to 14
% On Output:
%   num_of_solvable (int): The number of boards that were solvable
% Call:
%   solvable = CS4300_A1_Part_I_1(5000, 4);
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016

if num_of_pits < 0 || num_of_pits > 14
    error('Invalid number of pits. The range is 0-14');
end

num_of_solvable = 0;
for i = 1:num_of_boards
    if CS4300_Wumpus_solvable(CS4300_gen_board_A1(num_of_pits))
        num_of_solvable = num_of_solvable + 1;
    end
end

end