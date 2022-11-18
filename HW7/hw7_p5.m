% This script has the purpose of guessing the curve of best fir for the
% provided dataset. I will build a script that calculates the general
% linear regression of the dataset using the n cosines, where n is an input
% parameter supplied to the function. I will start off at 1, then continue
% incrementing the order until we have reached a suitable r^2 value and syx
% value. If I'm not mistaken this sort of exploits the same property that
% Fourier Transforms exploit- that periodic graphs can be expressed as
% functions of the sum of trig identities with different frequencies
clc; clear;
% First, I'll load the dataset
guess_fit_data = load("hw7_p5.mat");
t = guess_fit_data.t;
y = guess_fit_data.y;
% Setting my r_squared and syx to something unreasonable so I'm sure the
% first loop runs
r_squared = 0;
syx = 100;
a_bar_true = []; % saves the resulting coefficiets
recorded_guesses = []; % saves the previous guesses' r^2 and syx values
n = 1; % we start at 1
plot(t,y); % Plotting the actual function for reference
hold on;
while r_squared < 0.99 || syx > 0.1
    [a_bar_true, r_squared, syx] = general_linear_regression_trig(t, y, n);
    recorded_guesses(n, :) = [r_squared, syx];
    if (r_squared < 0.99 || syx > 0.1)
        n = n+1;
    end
end
new_y = 0;
new_t = 0:0.1:t(2514);
for i = 1:1:n
new_y = new_y + a_bar_true(i)*cos(i*new_t);
end
plot(new_t, new_y)

function [a_bar, r_squared, syx] = general_linear_regression_trig(x,y,n)
    Z = [];
    for i = 1:n
        Z = [Z cos(i*x')];
    end
    a_bar = (Z'*Z)\(Z'*y');
    Sr = sum((y'-Z*a_bar).^2);
    r_squared = 1 - Sr/sum((y'-mean(y')).^2);
    syx = sqrt(Sr/(length(x)-length(a_bar)));
end