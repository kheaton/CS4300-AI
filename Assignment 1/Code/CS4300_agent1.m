function [steps, res] = CS4300_agent1()
% CCS4300_agent1 - Uses randomly distributed actions to attempt to get gold from a set 4x4 board
% On Input:
%   NONE
% On Output:
%   steps   (Int):  The number of steps the agent took before dying or reaching the gold
%   res     (Int):  The end result of the steps
%       (1): Death by pit
%       (2): Death by Wumpus
%       (3): Gold
% Call:
%   [steps, res] = CS4300_agent1();
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016

% The 4x4 board: 0 - Nothing, 1 - Pit, 2 - Wumpus, 3 - Gold
% note that this board is rotated 90 degrees clockwise in order for the coordinates to match correctly
board = [
    0 0 1 0;
    0 0 0 1;
    0 1 0 3;
    0 1 0 0]

% face can be set to one of these in order to know which way the player is facing
RIGHT = [1 0];
LEFT = [-1 0];
UP = [0 1];
DOWN = [0 -1];

% the valid values of face are defined above, add face to pos in order to move that direction.
%This doens't make sure that it is valid so that must be checked afterwards
face = RIGHT

% the current location
pos = [1 1]

steps = 0
res = 0

while res == 0
end

end

