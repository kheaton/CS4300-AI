function [ac1Reductions, ac3Reductions, ac1Times, ac3Times, startingLabels] = CS4300_Run_Tests()
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
    P_function = '';

    n = 4:10;
    p = 0 : 0.2 : 1;
    numberOfTrials = 200;
    
    startMatrix = zeros(length(n), 1, length(p));
    
    startingLabels = startMatrix;
    ac1Reductions = startMatrix;
    ac3Reductions = startMatrix;
    
    ac1Times = startMatrix;
    ac3Times = startMatrix;
    
    totalSteps = length(n) * length(p) * numberOfTrials;
    count = 0;
    h = waitbar(0, 'Please wait...');
    for i = 1 : length(n)
        %Generate identity matrix for g
        g = ~eye(n(i),n(i));
        for j = 1 : length(p)
            ac1ReductionCount = 0;
            ac1TimeCount = 0;
            ac3ReductionCount = 0;
            ac3TimeCount = 0;
            
            for t = 1 : numberOfTrials   
                %Generate the random domain
                d = CS4300_Generate_D(n(i), p(j));
                
                %perform arc consistency test
                [ac1r, ac1t, ac3r, ac3t] = CS4300_Arc_Consistency(g, d, P_function);
                
                %add totals to calculate average
                ac1ReductionCount = ac1ReductionCount + ac1r;
                ac1TimeCount = ac1TimeCount + ac1t;
                ac3ReductionCount = ac3ReductionCount + ac3r;
                ac3TimeCount = ac3TimeCount + ac3t;
                
                count = count + 1;
                waitbar(count / totalSteps);
            end
            startingLabels(i, n(i), j) = ceil(n(i)^2 * p(j));
            ac1Reductions(i, n(i), j) = ac1ReductionCount / numberOfTrials;
            ac3Reductions(i, n(i), j) = ac3ReductionCount / numberOfTrials;
            
            ac1Times(i, n(i), j) = ac1TimeCount / numberOfTrials;
            ac3Times(i, n(i), j) = ac3TimeCount / numberOfTrials;
        end
    end
    
    close(h);
end

