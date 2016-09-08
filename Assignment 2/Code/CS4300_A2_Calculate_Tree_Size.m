function ret = CS4300_A2_Calculate_Tree_Size(root_node)
% CS4300_A2_Calculate_Tree_Size - Returns the size of the tree starting from the given node
% On input:
%   root_node (Node): The node to begin calculating from
%
% On output:
%   ret (Int): How many nodes are in the tree starting with root_node
%
% Call:
%   ret = CS4300_A2_Calculate_Tree_Size(root_node);
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%

ret = 1;
for child = root_node.children
    ret = ret + CS4300_A2_Calculate_Tree_Size(child);
end

end