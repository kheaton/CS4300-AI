function [ option_1_results, option_2_results ] = CS4300_A2_Run_Tests(num_tests)
% CS4300_A2_Run_Tests - Runs 2000 iterations of the A* algorithm and gets
% the number of nodes in the tree

% On input:
%   num_tests: Number of times to run the test against the A* algorithm
%
% On output:
%   option_1_results: Vector of the number of nodes from running A* with option 1
%   option_2_results: Vector of the number of nodes from running A* with option 2
%
% Call:
%   [option_1_results, options_2_results] = CS4300_A2_Run_Tests();
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%

option_1_results = zeros(num_tests, 1);
option_2_results = zeros(num_tests, 1);

bar = waitbar(0, 'Please wait...');

for i = 1:num_tests
    %Generate random board
    [board, goal_state] = CS4300_A2_20percent_Pit_Board();
    [solution, nodes] = CS4300_Wumpus_A_star1(board, [1,1,0], goal_state, '', 1);
    [temp, number_of_nodes] = size(nodes);
    
    option_1_results(i,1) = number_of_nodes;
    
    [board, goal_state] = CS4300_A2_20percent_Pit_Board();
    [solution, nodes] = CS4300_Wumpus_A_star1(board, [1,1,0], goal_state, '', 2);
    [temp, number_of_nodes] = size(nodes);
    
    option_2_results(i,1) = number_of_nodes;
    waitbar(i/num_tests);
end

close(bar);