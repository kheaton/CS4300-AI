function D = CS4300_Generate_D(size, percentage)
%CS4300_Generate_D - Function to randomly generate D for a given size and
%percentage of 1s
%On_input:
%   size: the length of a side of the board you wish to generate
%   percentage: the percentages of of the domain that should be 1s
%On_Output:
%   D: A randomly generated domain matrix that is size * size big with the given
%   percentage of the domain matrix being 1s
%Call:
%   CS4300_Generate_D(10, 0.2)
%Author:
%   Braden Scothern and Kyle Heaton
%   UU
%   Fall 2016

    D = rand(size, size) < percentage;

    %https://www.mathworks.com/matlabcentral/answers/111540-generating-a-random-binary-matrix
    %numberOfOnes = ceil(size * size * percentage);
    %D = zeros(size, size);
    %D(1:numberOfOnes) = 1;
    %D(randperm(numel(D))) = D;
end

