function D_revised = CS4300_AC3(G,D,P)
% CS4300_AC3 - AC3 function from Mackworth paper 1977
% On input:
%   G (nxn array): neighborhood graph for n nodes
%   D (nxm array): m domain values for each of n nodes
%   P (string): predicate function name; P(i,a,j,b) takes as
%     arguments:
%       i (int): start node index
%       a (int): start node domain value
%       j (int): end node index
%       b (int): end node domain value
% On output:
%   D_revised (nxm array): revised domain labels. If the algorithm fails then (D * -1) is returned
% Call:
%   G = 1 - eye(3,3);
%   D = [1,1,1;1,1,1;1,1,1];
%   Dr = CS4300_AC3(G,D,’CS4300_P_no_attack’);
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016
%

%percent = CS4300_Count_Ones(D) / length(D)^2;

%D_revised = CS4300_Generate_D(length(D), percent * rand());
%%D_revised = zeros(length(D));
%pause(length(G) * 0.001 * percent * rand());

origD = D;
D_revised = D;

q = [];
p = [];

for i = 1:length(D);
    for j = 1:length(D)
        if i ~= j
            q=[q(1:length(q)),[i,j]];
        end
    end
end

while ~isempty(q)
    
    x = q(1);
    y = q(2);
    q = q(3:length(q));
    
    % arc-reduce
    reduced = 0;
    for i = 1:length(D)
        if D(i, x) == 1
            found = 0;
            for j = 1:length(D)
                if j ~= i && D(j, y) == 1
                    found = 1;
                end
            end
            
            if found == 0
                D(i,x) = 0;
                reduced = 1;
            end
        end
    end
    
    % adjust lists
    if reduced == 1
        for i = 1:length(D)
            if i ~= x
                pair = [i, x];
                found = 0;
                j = 1;
                while j < length(q)
                    v = q(j);
                    j = j + 1;
                    v2 = q(j);
                    j = j + 1;
                    
                    if v == pair(1) && v2 == pair(2)
                        found = 1;
                    end
                end

                if found == 0
                    q = [q(1:length(q)), pair];
                end
            end
        end
    end
    disp(D);
end

D_revised = D;

end