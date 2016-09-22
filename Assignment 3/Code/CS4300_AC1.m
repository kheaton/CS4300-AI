function D_revised = CS4300_AC1(G,D,P)
% CS4300_AC1 - AC1 function from Mackworth paper 1977
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
%   D_revised (nxm array): revised domain labels
% Call:
%   G = 1 - eye(3,3);
%   D = [1,1,1;1,1,1;1,1,1];
%   Dr = CS4300_AC1(G,D,’CS4300_P_no_attack’);
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016
%

%percent = CS4300_Count_Ones(D) / length(D)^2;

%D_revised = CS4300_Generate_D(length(D), percent * rand());
%%D_revised = zeros(length(D));
%pause(length(G) * 0.002 * percent * rand());

origD = D;
D_revised = D;

q = [];
for i = 1:length(D)
    q = [q(1:length(q)), i];
end

while ~isempty(q)
    q_ = q(1);
    q = q(2:length(q));
    
    % reduce
    found = 0;
    changed = 0;
    for i = 1:length(D)
        if D(i,q_) == 1
            if found == 0
                found = 1;
            else
                D(i,q_) = 0;
            end
        end
    end
    
    if found == 0
        changed = 1;
    end
    
    % adjust lists
    if changed == 1
        % check if the current row has an open spot for a queen
        for i = 1:length(D);
            if D(i,q_) == 1
                changed = 0;
            end
        end
        
        if changed == 1
            % failed
            D_revised = origD * -1;
            return
        else
            % add changes back in
            i = q(1) - 1;
            while q(1) ~= 1
                q = [i,q(1:length(q))];
                i = i - 1;
            end
        end
    end 
    
    disp(D);
end

end