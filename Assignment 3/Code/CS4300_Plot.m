function CS4300_Plot()
%CS4300_PLOT Summary of this function goes here
%   Detailed explanation goes here

    [reductions, ac1t, ac3t] = CS4300_Run_Tests();
    
    plot(reductions);
    
end

