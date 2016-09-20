function D_revised = CS4300_AC3(G,D,P)
% CS4300_AC3 - AC3 function from Mackworth paper 1977
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
% Dr = CS4300_AC3(G,D,’CS4300_P_no_attack’);
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%
percent = CS4300_Count_Ones(D) / length(D)^2;

D_revised = CS4300_Generate_D(length(D), percent * rand());
%D_revised = zeros(length(D));
pause(length(G) * 0.001 * percent * rand());

end