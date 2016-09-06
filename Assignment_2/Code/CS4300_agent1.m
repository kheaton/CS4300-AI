function action = CS4300_agent1(percept)
% CS4300_agent1 - random agent example
%    It randomly either changes direction or moves forward
% On input:
%     percept (1x5 Boolean vector): percept values
%       (1): Stench
%       (2): Pit
%       (3): Glitters
%       (4): Bumped
%       (5): Screamed
% On output:
%     action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;   -- NOT USED
%       SHOOT = 5;  -- NOT USED
%       CLIMB = 6;  -- NOT USED
% Call:
%     a = CS4300_agent1([0,1,0,0,0]);
% Author:
%   Braden Scothern & Kyle Heaton  
%   UU
%   Fall 2016
%

switch randi(3)
    case 1
        action = 1;
    case 2
        action = 2;
    case 3
        action = 3;
end

end

