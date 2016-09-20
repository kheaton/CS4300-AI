function count = CS4300_Count_Ones( D )
%CS4300_Count_Ones - Function that will count the number of 1s in a given
%domain label matrix
%On_Input:
%   D: Binary matrix of domain labels
%On_Output:
%   count: Integer count of the number of 1s in the domain matrix
%Call:
%   D = [1,1,1;1,1,1;1,1,1];
%   count = CS4300_Count_Ones( D );
%Authors: 
%   Braden Scothern and Kyle Heaton
%   UU
%   Fall 2016

    count = 0;
    
    for i = 1 : length(D)
        for j = 1 : length(D)
            if(D(i, j) == 1)
                count = count + 1;
            end
        end
    end
end

