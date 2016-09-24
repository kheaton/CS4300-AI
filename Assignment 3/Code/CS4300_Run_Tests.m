function [reductions, ac1Times, ac3Times] = CS4300_Run_Tests()
% CS4300_Run_Tests - 
% On input:
%   Nothing
% On output:
%   reductions: a mtrix of the reductions for ac3
%   ac1Times: a matrix of the Ac1 timings
%   ac3Times: a matrix of the Ac3 timings
% Call:
%   [reduc, ac1t, ac3t] = CS4300_Run_Tests()
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%


    P_function = 'CS4300_P_no_attack';

    n = 4:10;
    p = 0 : 0.2 : 1;
    numberOfTrials = 200;
    
    %n, (x, y) - (starting number of labels, expected reduction in Labels)
    %reduction should be the same for ac1 and ac3
    %expected reduction should be an average of the 200 trials with each
    %percentage
    totalSteps = length(n) * length(p) * numberOfTrials;
    res = zeros(totalSteps, 7);
    totalSteps = totalSteps + (length(n) * length(res) * max(n)^2);
    
    ac1Times = zeros(1, length(n));
    ac3Times = zeros(1, length(n));
    
    trial = 1;
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
                
                res(trial, 1) = n(i);
                res(trial, 2) = p(j);
                res(trial, 3) = CS4300_Count_Ones(d);
                res(trial, 4) = ac1r;
                res(trial, 5) = ac3r;
                res(trial, 6) = ac1t;
                res(trial, 7) = ac3t;

                trial = trial + 1;
                waitbar(trial / totalSteps);
            end
        end
        
        ac1Times(1, i) = ac1TimeCount / length(p) * numberOfTrials;
        ac3Times(1, i) = ac3TimeCount / length(p) * numberOfTrials;
    end    
    
    reductions = ones(length(n), max(n)^2) * -1;

    for i = 1:length(n)
        for j = 1 : n(i)^2 + 1
            instanceCount = 0;
            total = 0;
            for k = 1 : length(res)
                valueOfN = res(k, 1);
                reduction = res(k, 5);
                if(valueOfN == n(i) && reduction == j-1)
                    instanceCount = instanceCount + 1;
                    total = total + reduction;
                end
                trial = trial + 1;
                waitbar(trial / totalSteps);
            end
            if(total > 0)
                reductions(i, j) = total / instanceCount;
            else
                reductions(i, j) = 0;
            end
        end
    end
    
    close(h);
end

