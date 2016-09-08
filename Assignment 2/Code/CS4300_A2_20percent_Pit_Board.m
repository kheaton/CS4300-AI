function board = CS4300_A2_20percent_Pit_Board()
% CS4300_A2_20percent_Pit_Board - Creates a Wumpus Board with both the wumpus and gold randomly placed and a 20% chance for a pit at each location
% On input:
%   No Inputs
%
% On output:
%   board (4x4 int array): Wumpus board layout
%       0: means empty cell
%       1: means a pit in cell
%       2: means gold (only) in cell
%       3: means Wumpus (only) in cell
%       4: means gold and Wumpus in cell
%
% Call:
%   dis = CS4300_A2_Manhattan_Distance([1, 1, 1], [4, 4, 1]);
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%

board = zeros(4,4);

% Place Wumpus
x = randi(4);
y = randi(4);

board(x,y) = 3;

% Place Gold
x = randi(4);
y = randi(4);

if board(x,y) == 3  % Check if the wumpus is in that location and update it to have both if so
    board(x,y) = 4;
else
    board(x,y) = 2;
end

% Place Pits
for i = 1:4
    for j = 1:4
        if ~(i == 1 && j == 1)      % The instructions state that we cannot place a pit in the starting location
            if board(i,j) == 0      % Don't change the gold/wumpus into a pit
                if randi(5) == 1    % This is a 20% chance to be true and when it is we place the pit
                    board(i, j) = 1;
                end
            end
        end
    end
end

end