function duplicate = CS4300_A2_Node_Is_Duplicate(potential_node, root_node)
% CS4300_A2_Node_Is_Duplicate - Finds out if a node is a duplicate
% On input:
%   potential_node (Node): The node that would like to be added to the root_node's children if not a duplciate
%   root (Node): The root of the tree which needs to be searched for duplicates
%
% On output:
%   duplicate (Boolean): Returns TRUE if the potential_node is already found in the tree
%
% Call:
%   duplicate = CS4300_A2_Node_Is_Duplicate(potential_node, root_node);
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%
for child = root_node.children
    if potential_node.state == child.state
        duplicate = true;
        return
    end
    
    duplicate = CS4300_A2_Node_Is_Duplicate(potential_node, child);
    if duplicate
        return
    end
end
duplicate = false;
end