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
%   D_revised (nxm array): revised domain labels.
% Call:
%   G = 1 - eye(3,3);
%   D = [1,1,1;1,1,1;1,1,1];
%   Dr = CS4300_AC3(G,D,'CS4300_P_no_attack');
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016
%

% Comment out if str2func() isn't available and comment the usage of predFunc below while uncommenting the line below
predFunc = str2func(P); 

q = struct(...
    'value', {},...
    'arcs', []);
newQ = q;

for i = 1:length(G)
    q(i).value = i;
    for j = 1:length(G)
        if G(i,j) ~= 0
            q(i).arcs = [q(i).arcs(1:length(q(i).arcs)), j];
        end
    end
end

num = 1;
while size(q, 2) >= num
    n = q(num);
    num = num + 1;

    arcNum = 1;
    while length(n.arcs) >= arcNum
        arc = n.arcs(arcNum);
        arcNum = arcNum + 1;

        % check current domain
        idx = 0;
        for i = 1:length(D(:, n.value))
            if D(i,n.value) == 1
                idx = i;

                 % check the domain of arcs
                for j = 1:length(D(:, arc))
                    % check if there is an attack since that is what the predFunc is doing
                    
                    if predFunc(n.value, idx, arc, j) == 0 && D(j, arc) == 1               % comment out when str2func() isn't available
                    %if ~CS4300_P_no_attack(n.value, idx, arc, j) && D(idx, arc) == 1    % This should be uncommented out if str2func() isn't available
                    
                        count = 0;
                        for k = 1:length(D(:,arc))
                            if D(k,arc) == 1
                                count = count + 1;
                            end
                        end
                        
                        if count == 1
                            D(idx, n.value) = 0;
                            
                            % add back in the 1 arc that will need to be checked because of this removal
                            tmpQ = newQ;
                            tmpQ(1).value = arc;
                            tmpQ(1).arcs = [n.value];
                            q = [q(1:size(q,2)), tmpQ(1)];
                        end
                    end
                end

            end
        end

        if idx == 0
            % we failed to find a solution
            disp('failed');
            D_revised = D;
            return
        end

    end
end

D_revised = D;

end