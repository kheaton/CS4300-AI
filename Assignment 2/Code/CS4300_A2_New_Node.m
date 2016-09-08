function new_node = CS4300_A2_New_Node()
% CS4300_A2_New_Node - Creates a new empty struct that is a node in the wumpus world
% On input:
%   No Inputs
%
% On output:
%   new_node (Node): A node with the following fields
%       parent (int): index of node’s parent
%       level (int): level of node in search tree
%       state (1x3 vector): [x,y,dir] state represented by node
%       action (int): action along edge from parent to node
%       g (int): path length from root to node
%       h (float): heuristic value (estimate from node to goal)
%       cost (float): g + h (called f value in text)
%       children (1xk vector): list of node’s children
%
% Call:
%   dis = CS4300_A2_Manhattan_Distance([1, 1, 1], [4, 4, 1]);
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%
new_node = struct(...
    'parent', {},...
    'level', {},...
    'state', {},...
    'action', {},...
    'g', {},...
    'h', {},...
    'cost', {},...
    'children', {});
end