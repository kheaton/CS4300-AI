function duplicate = CS4300_A2_State_Is_Duplicate(potential_state, root_node)
% CS4300_A2_Node_Is_Duplicate - Finds out if a node is a duplicate
% On input:
%   potential_state (1x3 vector): [x,y,dir] state represented by node
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

if potential_state == root_node.state
    duplicate = true;
    return
end

for child = root_node.children
    duplicate = CS4300_A2_Node_Is_Duplicate(potential_state, child);
    if duplicate
        return;
    end
end
duplicate = false;
end