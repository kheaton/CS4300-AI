function [ac1Reductions, ac3Reductions, ac1Times, ac3Times, startingLabels] = CS4300_Run_Tests()
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
    numberOfTrials = 2;%00;
    
    %n, (x, y) - (starting number of labels, expected reduction in Labels)
    %reduction should be the same for ac1 and ac3
    %expected reduction should be an average of the 200 trials with each
    %percentage
    
    dim1 = length(p) * numberOfTrials;
    dim2 = 3;
    dim3 = length(n);
    
    reductions = zeros(dim1, dim2, dim3);
    
    ac1Times = zeros(length(n));
    ac3Times = zeros(length(n));
    
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
                
                reductions(i, 1, count) = CS4300_Count_Ones(d);
                reductions(i, 2, count) = ac1r;
                reductions(i, 3, count) = ac3r;
                
                ac1TimeCount = ac1TimeCount + ac1t;
                ac3TimeCount = ac3TimeCount + ac3t;
                
                count = count + 1;
                waitbar(count / totalSteps);
            end
        end
        
        ac1Times(i) = ac1TimeCount / length(p) * numberOfTrials;
        ac3Times(i) = ac3TimeCount / length(p) * numberOfTrials;
    end
    
    close(h);
end

