clc; clear;
% This Matlab Script implements an iterative matrix multiplication algorithm to
% "Determine the probabilities of the allegiance of a Seminole fan’s great-grandchild"
% I will follow the general algorithm presented in the hw4 file, going up to the third iteration

p_i = [0 0 1];
p_m = [0.95 0 0.05; 0.25 0.5 0.25; 0.1 0 0.9];

for i = 1:3
    p_i = p_i*p_m;
end

% RAHHHHH I LOVE MATRICES NOW
disp("Probabilities of a Seminole fan's great-grandchild of being a 1. Gator, 2. Daywalker, and 3. Loser");
disp(p_i);