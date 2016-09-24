function res = CS4300_P_no_attack(i,a,j,b)
% CS4300_P_no_attack - This function determins if 2 nodes do not attack one another
% On input:
%   i (int): start node index
%   a (int): start node domain value
%   j (int): end node index
%   b (int): end node domain value
% On output:
%   res (bool): True if there is no attack between the 2 nodes
% Call:
%   res = CS4300_P_no_attack(1,2,2,1);
% Author:
%   Braden Scothern & Kyle Heaton
%   UU
%   Fall 2016
%

res = true;

x = 0;
y = 0;

if i < j
    x = 1;
elseif i > j
    x = -1;
end

if a < b
    y = 1;
elseif a > b
    y = -1;
end

newI = i;
newA = a;

while ~(newI == j || newA == b)
    newI = newI + x;
    newA = newA + y;
end

if newI == j && newA == b
    res = false;
end

end

