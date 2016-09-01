function [steps, res] = CS4300_A1_Part_II_2()
% CS4300_A1_Part_II_2 - Uses CS4300_agent1 to get instructions and will then execute those instructions
% On Input:
%   NONE
% On Output:
%   steps   (Float):  The number of steps the agent took before dying or reaching the gold
%   res     (Int):  The end result of the steps
%       (1): Death by pit
%       (2): Death by Wumpus    -- NOT USED
%       (3): Gold
% Call:
%     [steps, res] = CS4300_A1_Part_II_2();
% Author:
%   Braden Scothern & Kyle Heaton  
%   UU
%   Fall 2016
%

% The 4x4 board: 0 - Nothing, 1 - Pit, 2 - Wumpus, 3 - Gold
% note that this board is rotated 90 degrees clockwise in order for the coordinates to match correctly
board = [
    0 0 1 0;
    0 0 0 1;
    0 1 0 3;
    0 1 0 0];

% face can be set to one of these in order to know which way the player is facing
RIGHT_step = [1 0];
LEFT_step = [-1 0];
UP_step = [0 1];
DOWN_step = [0 -1];

RIGHT = 1;
LEFT = 2;
UP = 3;
DOWN = 4;

% the valid values of face are defined above, add face to pos in order to move that direction.
%This doens't make sure that it is valid so that must be checked afterwards
face = RIGHT;

% the current location
pos = [1 1];

steps = 0.0;
res = 0;

while res == 0
    action = CS4300_agent1([0 0 0 0 0]);
    switch action
        case 1  % step forward
            % get the new location
            dir = [0 0];
            switch face
                case RIGHT
                    dir = RIGHT_step;
                case LEFT
                    dir = LEFT_step;
                case UP
                    dir = UP_step;
                case DOWN
                    dir = DOWN_step;
            end
            potential_pos = pos + dir;
            
            % if this check fails then we are bouncing off the wall
            if ~(potential_pos(1) < 1 || potential_pos(1) > 4 || potential_pos(2) < 1 || potential_pos(2) > 4) == 1
                pos = potential_pos;
                steps = steps + 1.0;

                % check to see what happened with the step
                step_res = board(pos(1), pos(2));
                switch step_res
                    case 1
                        res = 1;
                    case 2
                        res = 2;
                    case 3
                        res = 3;
                end
                
                if res ~= 0
                    return
                end
            end
        case 2  % turn left
            if face == RIGHT
                face = UP;
            elseif face == LEFT
                face = DOWN;
            elseif face == UP
                face = LEFT;
            elseif face == DOWN
                face = RIGHT;
            end

        case 3  % turn right
            switch face
                case RIGHT
                    face = DOWN;
                case LEFT
                    face = UP;
                case UP
                    face = RIGHT;
                case DOWN
                    face = LEFT;
            end
    end
end

end