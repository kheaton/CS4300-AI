function expanded_states = CS4300_A2_Expand_States( state_to_expand )

% CS4300_A2_Expand_States
% On input:
%   state_to_expand (1x3 vector): x,y,dir state
% On output:
%   expanded_states: matrix of expanded states from choossing to go
%                    forward, right, and left respectivley. 
% Call:
%   expanded_states = CS4300_A2_Expand_States({1,1,1})
% expanded_states =
%   1 2 1
%   1 1 2
%   1 1 0
%   
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016

    expanded_states = zeros(3);

    switch state_to_expand(3)
        case 0
            if(state_to_expand(1) + 1 > 4)
                expanded_states(1,1) = state_to_expand(1);
            else
                expanded_states(1,1) = state_to_expand(1) + 1;
            end
            expanded_states(1,2) = state_to_expand(2);
        case 1
            if(state_to_expand(2) + 1 > 4)
                expanded_states(1,2) = state_to_expand(2);
            else
                expanded_states(1,2) = state_to_expand(2) + 1;
            end
            expanded_states(1,1) = state_to_expand(1);
        case 2
            if(state_to_expand(1) - 1 < 1)
                expanded_states(1,1) = state_to_expand(1);
            else
                expanded_states(1,1) = state_to_expand(1) - 1;
            end
            expanded_states(1,2) = state_to_expand(2);
        case 3
            if(state_to_expand(2) - 1 < 1)
                expanded_states(1,2) = state_to_expand(2);
            else
                expanded_states(1,2) = state_to_expand(2) - 1;
            end
            expanded_states(1,1) = state_to_expand(1);
    end
    expanded_states(1,3) = state_to_expand(3);

    expanded_states(2,1) = state_to_expand(1);
    expanded_states(2,2) = state_to_expand(2);
    expanded_states(2,3) = mod(state_to_expand(3) + 1, 3);

    expanded_states(3,1) = state_to_expand(1);
    expanded_states(3,2) = state_to_expand(2);

    if(state_to_expand(3) - 1 < 0)
        expanded_states(3,3) = 3;
    else
        expanded_states(3,3) = state_to_expand(3) - 1;
    end

end

