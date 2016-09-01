function [mean, var, success, con_mean, con_var, con_success] = CS4300_A1_Part_II_2_runner(num_of_trials)
% CS4300_A1_Part_II_2_runner - Uses CS4300_A1_Part_II_2() to get tests results and calulcates Part 2.2's requirements
% On Input:
%   num_of_trials   (Int): The number of trails to complete before returning
% On Output:
%   mean        (Float): The mean number of steps from each trial
%   var         (Float): The variance of the number of steps from the trials
%   success     (Float): The percentage of trials where the agent got the gold
%   con_mean    (Float): The 95% confidence interval for the mean
%   con_var     (Float): The 95% confidence interval for the variance
%   con_success (Float): The 95% confidence interval for the success
% Call:
%     [mean, var, success, con_mean, con_var, con_success] = CS4300_A1_Part_II_2_runner(2000);
% Author:
%   Braden Scothern & Kyle Heaton  
%   UU
%   Fall 2016
%


% Run the tests and save all of the results
test_results = zeros(num_of_trials, 2);
for i = 1:num_of_trials
    [steps, res] = CS4300_A1_Part_II_2();
    test_results(i, 1) = steps;
    test_results(i, 2) = res;
end

% --- CALCULATE RESULTS ---

% get mean and success rate
mean = 0.0;
success = 0.0;
for i = 1:num_of_trials
    mean = mean + test_results(i, 1);
    
    if test_results(i, 2) == 3
        success = success + 1.0;
    end
end
mean = mean / num_of_trials;
success = success / num_of_trials * 100.0;

% get var
var = 0.0;
for i = 1:num_of_trials
    tmp = test_results(i, 1) - mean;
    var = var + (tmp * tmp);
end
var = var / num_of_trials;

con_mean = 0.0;
con_var = 0.0;
con_success = 0.0;

end