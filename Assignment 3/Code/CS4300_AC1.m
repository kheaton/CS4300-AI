function D_revised = CS4300_AC1(G,D,P)
% CS4300_AC1 - AC1 function from Mackworth paper 1977
% On input:
% G (nxn array): neighborhood graph for n nodes
% D (nxm array): m domain values for each of n nodes
% P (string): predicate function name; P(i,a,j,b) takes as
% arguments:
% i (int): start node index
% a (int): start node domain value
% j (int): end node index
% b (int): end node domain value
% On output:
% D_revised (nxm array): revised domain labels
% Call:
% G = 1 - eye(3,3);
% D = [1,1,1;1,1,1;1,1,1];
% Dr = CS4300_AC1(G,D,�CS4300_P_no_attack�);
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%

%percent = CS4300_Count_Ones(D) / length(D)^2;

%D_revised = CS4300_Generate_D(length(D), percent * rand());
%%D_revised = zeros(length(D));
%pause(length(G) * 0.002 * percent * rand());

D_revised = D;
x = [];
y = [];
for i = 1:length(D)
    for j = 1:length(D)
        x = [x(1:length(x)), i];
        y = [y(1:length(y)), j];
    end
end

while ~isempty(x)
    x_ = x(1);
    x = x(2:length(x));
    y_ = y(1);
    y = y(2:length(y));
    
    % reduce
    
    % adjust lists
    if changed == 1
    end 
end

end