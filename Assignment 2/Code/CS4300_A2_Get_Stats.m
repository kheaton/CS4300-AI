function [ mean_op_1, var_op_1, ci_low_op_1, ci_high_op_1, mean_op_2, var_op_2, ci_low_op_2, ci_high_op_2 ] = CS4300_A2_Get_Stats()
%CS4300_A2_GET_STATS Summary of this function goes here

% On input: None
%
% On output:
%   mean_op_1: Mean of the number of nodes in option 1
%   var_op_1: Variance of the number of nodes in option 1
%   ci_low_op_1: Lower 95% confidence internval of the number of nodes in option 1
%   ci_high_op_1: Upper 95% confidence internval of the number of nodes in option 1
%   mean_op_2: Mean of the number of nodes in option 2
%   var_op_2: Variance of the number of nodes in option 2
%   ci_low_op_2: Lower 95% confidence internval of the number of nodes in option 2
%   ci_high_op_2: Upper 95% confidence internval of the number of nodes in option 2
%
% Call:
%   [ mean_op_1, var_op_1, ci_low_op_1, ci_high_op_1, mean_op_2, var_op_2, ci_low_op_2, ci_high_op_2 ] = CS4300_A2_Get_Stats()
%
% Author:
% Braden Scothern & Kyle Heaton
% UU
% Fall 2016
%

num_trials = 2000;
[op1, op2] = CS4300_A2_Run_Tests(num_trials);

mean_op_1 = mean(op1);
var_op_1 = var(op1);

ci_low_op_1 = mean_op_1 - 1.96 * sqrt(var_op_1 / num_trials);
ci_high_op_1 = mean_op_1 + 1.96 * sqrt(var_op_1 / num_trials);

mean_op_2 = mean(op2);
var_op_2 = mean(op2);

ci_low_op_2 = mean_op_2 - 1.96 * sqrt(var_op_2 / num_trials);
ci_high_op_2 = mean_op_2 + 1.96 * sqrt(var_op_2 / num_trials);

end

