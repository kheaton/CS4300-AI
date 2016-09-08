function dis = CS4300_A2_Manhattan_Distance(initial_state, goal_state)
% CS4300_Wumpus_A_star1 - A* algorithm for Wumpus world
% On input:
%   initial_state (1x3 vector): x,y,dir state
%   goal_state (1x3 vector): x,y,dir state
%
% On output:
%   dis (int): The Manhattan distance from initial_state to goal_state
%
% Call:
%   dis = CS4300_A2_Manhattan_Distance([1, 1, 1], [4, 4, 1]);
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%
dis = abs(goal_state(1) - initial_state(1)) + abs(goal_state(2) - initial_state(2));
end