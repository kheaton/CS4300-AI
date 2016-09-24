function [reductions, ac1Times, ac3Times] = CS4300_Run_Tests()
% CS4300_Run_Tests - 
% On input:
%
% arguments:
%
% On output:
%
% Call:
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%
    
% Sudo Code from class
%   for N = 4:10
%       G = ~eye(N,N)
%       for p = 0:0,2:1
%           for t = 1:200
%               D = rand(N,N) < p;
%               tic;
%               D1 = CS4300_AC1(G,D);
%               t1 = toc;
%               tic
%               D2 = CS4300_AC3(G,D)
%               t2 = toc;
%
%   Look up:
%       [p,s] = polyfit(...);
%

    P_function = 'CS4300_P_no_attack';

    n = 4:10;
    p = 0 : 0.2 : 1;
    numberOfTrials = 10;%200;
    
    %n, (x, y) - (starting number of labels, expected reduction in Labels)
    %reduction should be the same for ac1 and ac3
    %expected reduction should be an average of the 200 trials with each
    %percentage
        
    %reductions = zeros(1, 3, length(p) * numberOfTrials);
    reductions = zeros(1, 3);
    
    ac1Times = zeros(1, length(n));
    ac3Times = zeros(1, length(n));
    
    totalSteps = length(n) * length(p) * numberOfTrials;
    count = 1;
    h = waitbar(0, 'Please wait...');
    for i = 1 : length(n)
        %Generate identity matrix for g
        g = ~eye(n(i),n(i));
        %Set counts to get the everage time
        ac1TimeCount = 0;
        ac3TimeCount = 0;
        for j = 1 : length(p)
            for t = 1 : numberOfTrials   
                %Generate the random domain
                d = CS4300_Generate_D(n(i), p(j));
                
                %perform arc consistency test
                [ac1r, ac1t, ac3r, ac3t] = CS4300_Arc_Consistency(g, d, P_function);
                
                temp = zeros(1, 3);
                temp(1, 1) = n(i);
                temp(1, 2) = CS4300_Count_Ones(d);
                temp(1, 3) = ac3r;
                
                reductions = vertcat(reductions, temp);
                
                ac1TimeCount = ac1TimeCount + ac1t;
                ac3TimeCount = ac3TimeCount + ac3t;
                
                count = count + 1;
                waitbar(count / totalSteps);
            end
        end
        
        ac1Times(1, i) = ac1TimeCount / length(p) * numberOfTrials;
        ac3Times(1, i) = ac3TimeCount / length(p) * numberOfTrials;
    end    
    close(h);
end

