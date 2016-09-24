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
%   Dr = CS4300_AC3(G,D,’CS4300_P_no_attack’);
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016
%

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

while ~isempty(q)
    n = q(1);
    q = q(2:length(q));
    
    while ~isempty(n.arcs)
        arc = n.arcs(1);
        n.arcs = n.arcs(2:length(n.arcs));
        
        removed = 0;
        
        
        if removed == 1
            for i = 1:length(G)
                if G(n.value, i) ~= 0
                    tmpQ = newQ;
                    tmpQ(1).value = i;
                    tmpQ(1).arcs = [n.value];
                    q = [q(1:size(q,2)), tmpQ(1)];
                end
            end
        end
    end
end

D_revised = D;

end