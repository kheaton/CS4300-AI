function action = CS4300_Run_Tests()
% CS4300_Run_Tests - 
% On input:

% arguments:

% On output:

% Call:

% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%
    n = 4:10;
    p = 0 : 0.2 : 1;
    numberOfTrials = 200;
    
    ac1Results = zeros(length(n), length(p), numberOfTrials);
    ac3Results = zeros(length(n), length(p), numberOfTrials);
        
    for i = 1 : length(n)
        g = ~eye(n(i),n(i));
        for j = 1 : length(p)
            for t = 1 : numberOfTrials
                d = rand(n(i),n(i)) < j;
                timeStart = tic;
                d1 = CS4300_AC1(g, d);
                timeEnd = toc(timeStart);
                ac1Results(i, j, t) = timeEnd; 
                
                timeStart = tic;
                d2 = CS4300_AC3(g, d);
                timeEnd = toc(timeStart);
                ac3Results(i, j, t) = timeEnd;
            end
        end
    end
    
    action = ac3Results;
end

