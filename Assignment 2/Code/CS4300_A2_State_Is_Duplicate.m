function duplicate = CS4300_A2_State_Is_Duplicate(potential_state, nodes, idx)
% CS4300_A2_Node_Is_Duplicate - Finds out if a node is a duplicate
% On input:
%   potential_state (1x3 vector): [x,y,dir] state represented by node
%   nodes (1xK Node Array): nodes(1) is the root of the tree which needs to be searched for duplicates
%   idx (Int): The index to check
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

if potential_state == nodes(idx).state
    duplicate = true;
    return
end

for child = nodes(idx).children
    duplicate = CS4300_A2_State_Is_Duplicate(potential_state, nodes, child.num);
    if duplicate
        return;
    end
end
duplicate = false;
end