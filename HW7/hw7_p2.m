% This script computes the best fit cubic polynomial for US Daily Coronavirus cases for the months of March, April, and May of 2020.
% Then, it uses the cubic model to predict the number of daily cases in August 2020
clc; clear;
% First I'll make the actual cubic polynomial regression function
% Then I'll format the data and plop it in
data = load("hw7_p2.mat");
y = data.cases';
x = 1:length(y);
x_smooth = 1:0.001:(92+31);
a_bar = flip(cubic_regression(x, y));
plot(x_smooth, polyval(a_bar, x_smooth));
hold on;
plot(x, y, 'o');
xlabel('Days since March of 2020');
ylabel('Daily Coronavirus Cases');
title('Daily Covid Cases vs Days Since March');
function [a_bar] = cubic_regression(x,y)
    Z = [ones(size(x')) x' (x').^2 (x').^3];
    a_bar = (Z'* Z)\(Z' * y');
end