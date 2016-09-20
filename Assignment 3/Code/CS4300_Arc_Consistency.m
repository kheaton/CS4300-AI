function [ ac1Reduction, ac1Time, ac3Reduction, ac3Time ] = CS4300_Arc_Consistency(G, D, P)
%CS4300_Arc_Consistencey - Runs an arc consistency test for given G, D, and
%P
%On_Input:
%   G (nxn array): neighborhood graph for n nodes to be run in AC1 and AC3
%   D (nXm array): m domain values for each of the n nodes to be run in AC1
%   and AC3
%   P: Predicate function name; P(i, a, j, b) takes as arguments
%       i (int): start node index
%       a (int): start node domain value
%       j (int): end node index
%       b (int): end node domain value
%On_Output:
%   ac1Reduction: Number of 1s in D removed by AC1
%   ac1Time: Length of time it took AC1 to run
%   ac3Reduction: Number of 1s in D removed by AC3
%   ac3Time: Lendth of time it to AC3 to run
%Author:
%   Braden Scothern and Kyle Heaton
%   UU
%   Fall 2016

%Get the number of 1s D
    count = CS4300_Count_Ones(D);
%Make copies of D, just in case
    d1 = D;
    d3 = D;

    timeStart = tic;
    d1 = CS4300_AC1(G, d1, P);
    ac1Time = toc(timeStart);
    
    ac1Reduction = count - CS4300_Count_Ones(d1);
    
    timeStart = tic;
    d3 = CS4300_AC3(G, d3, P);
    ac3Time = toc(timeStart);
    
    ac3Reduction = count - CS4300_Count_Ones(d3);
end

