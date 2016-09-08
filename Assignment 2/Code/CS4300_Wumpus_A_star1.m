function [solution,nodes] = CS4300_Wumpus_A_star1(board,initial_state,...
goal_state,h_name,option)
% CS4300_Wumpus_A_star1 - A* algorithm for Wumpus world
% On input:
%   board (4x4 int array): Wumpus board layout
%       0: means empty cell
%       1: means a pit in cell
%       2: means gold (only) in cell
%       3: means Wumpus (only) in cell
%       4: means gold and Wumpus in cell
%   initial_state (1x3 vector): x,y,dir state
%   goal_state (1x3 vector): x,y,dir state
%   h_name (string): name of heuristic function
%   option (int): picks insertion strategy for equal cost states
%       1: insert state before equal or greater than states
%       2: insert after equal or less than states
% On output:
%   solution (nx4 array): solution sequence of state and the action
%   nodes (search tree data structure): search tree
%       (i).parent (int): index of node�s parent
%       (i).level (int): level of node in search tree
%       (i).state (1x3 vector): [x,y,dir] state represented by node
%       (i).action (int): action along edge from parent to node
%       (i).g (int): path length from root to node
%       (i).h (float): heuristic value (estimate from node to goal)
%       (i).cost (float): g + h (called f value in text)
%       (i).children (1xk vector): list of node�s children
% Call:
%   [so,no] = CS4300_Wumpus_A_star1([0,0,0,0;0,0,0,1;0,2,1,3;0,0,0,0],...
%             [1,1,0],[2,2,1],�CS4300_A_star_Man�,1)
% so =
%   1 1 0 0
%   2 1 0 1
%   2 1 1 3
%   2 2 1 1
%
% no = 1x9 struct array with fields:
% parent
% level
% state
% action
% cost
% g
% h
% children
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%
heuristic_func = str2func(h_name);

nodes = CS4300_A2_New_Node();   % Only the fields here need to be initialized, everything else defaults to []
nodes(1).level = 0;
nodes(1).state = initial_state;
nodes(1).action = 0;
nodes(1).cost = 0;

num_nodes = 1;
frontier = [1];
explored = [];

while 1==1
    if isEmpty(frontier)
        solution = [];
        return
    end
    node = frontier(1);
    frontier = frontier(2:end);
    explored = cat(1, explored, node);
    
    % change the frontier behavior according to option
    if option == 1
    elseif option == 2
    end
end
end