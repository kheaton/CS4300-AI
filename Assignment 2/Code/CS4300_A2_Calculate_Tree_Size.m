function ret = CS4300_A2_Calculate_Tree_Size(nodes)
% CS4300_A2_Calculate_Tree_Size - Returns the size of the tree starting from the given node
% On input:
%   nodes (Node): The nodes that we want the size of
%
% On output:
%   ret (Int): How many nodes are in the tree of nodes
%
% Call:
%   ret = CS4300_A2_Calculate_Tree_Size(root_node);
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%

ret = size(nodes, 2);
end