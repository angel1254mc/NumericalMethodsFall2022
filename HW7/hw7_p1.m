% This file fits a line to the 2022 
% Gators Footbal team's offense stats for each game thus far
% Author: Angel Lopez Pol
clc; clear;
% We are supposed to fit a line to the data, a parabola to the data,
% and an exponential function to the data.
% We are supposed to use the linear least squares algorithm

% I will be basing this code largely off of the examples provided in the
% book for linear regression (15.1, 15.3 and 15.4)
%% I just realized that my parabola function is using polynomial regression, 
% not simple linear regression. I have fixed this

x = [23 12 17 31 20 13 19 16 28];
y = [451 279 329 594 666 297 396 371 492];

% I'm going to model my functions similar to how the polyfit function works
% returning a_bar and then in the main method we could use a polyval function
% to get the line of best fit
% First sorting
[x_new, sortIndex] = sort(x);
y_new = y(sortIndex);
x = x_new;
y = y_new;
% First I'll plot the line
clf;
% I'll linearize my inputs, then regression_line takes care of the actual
% regression
[a_bar_1, r1] = regression_line(x,y); % Line
[a_bar_2, r2] = regression_line(log10(x),log10(y)); % Power/Parabola
[a_bar_3, r3] = regression_line(x,log(y)); % Exponential

% In order to graph them I gotta delinearize them

smooth_x = x(1):0.001:x(9);
plot(x,y);
hold on;
grid on;
plot(x,y,'o');
plot(smooth_x, a_bar_1(1) + a_bar_1(2)*smooth_x);
% I cant believe I took this long to figure out I had to delinearize a for
% the parabola and exponential function
plot(smooth_x, (10^a_bar_2(1))*(smooth_x).^a_bar_2(2));
plot(smooth_x, exp(a_bar_3(1))*exp(smooth_x.*a_bar_3(2)));

legend('', 'Original Data Points', 'Line', 'Power/Parabola', 'Exponential');
xlabel('First Downs');
ylabel('Total Yards');
title('Total Yards vs First Downs');
hold off;

function [a_bar, r_squared] = regression_line(x,y)
    % We can find the normal equations for the above equation and use left division
    % We could also use the method outline in the book, much more clean and concise
    Z = [ones(size(x')) x'];
    a_bar = (Z)\(y');
    Sr = sum((y'-Z*a_bar).^2);
    r_squared = 1 - Sr/sum((y'-mean(y')).^2);

    % Now solve for a0, a1, or 'x bar' in Ax=b
end




function [a_bar] = regression_parab(x,y)
    Z = [ones(size(x')) (log10(x'))];
    a_bar = (Z'*Z)\(Z'*(log10(y')));
    % This function linearizes x^2, and provides me with an a_bar vector
end
function [a_bar] = regression_exp(x,y)
    % This one is going to be a little more complicated because we need
    % to linearize our exponential for general linear regression,
    % The book has a really good explanation, however, thruu case study 16.5
    Z = [ones(size(log(y'))) log(x')];
    a_bar = (Z'*Z)\(Z'*log(y'));

    % Need to test this out to see if it works
end

function [a_bar] = poly_regression_parab(x,y)
    % I'll base my A and b matrices on the normal equations found on page 362 in the book
    % Also using guidance rom eq. 15.9 in the book
    A =  [size(x, 1) sum(x) sum(x.^2);
          sum(x) sum(x.^2) sum(x.^3);
          sum(x.^2) sum(x.^3) sum(x.^4);
        ];
    b = [sum(y); sum(x.*y); sum((x.^2).*y)];
    % Again, we could also use the method outline in the book, much more clean and concise
    Z = [ones(size(x')) x' (x').^2];
    a_bar2 = (Z)\(y');

    a_bar = A\b;
end

function [a, r2] = linregr(x,y)
% linregr: linear regression curve fitting
% [a, r2] = linregr(x,y): Least squares fit of straight
% line to data by solving the normal equations
% input:
% x = independent variable
% y = dependent variable
% output:
% a = vector of slope, a(1), and intercept, a(2)
% r2 = coefficient of determination
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
x = x(:); y = y(:); % convert to column vectors
sx = sum(x); sy = sum(y);
sx2 = sum(x.*x); sxy = sum(x.*y); sy2 = sum(y.*y);
a(1) = (n*sxy-sx*sy)/(n*sx2-sx^2);
a(2) = sy/n-a(1)*sx/n;
r2 = ((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2;
% create plot of data and best fit line
xp = linspace(min(x),max(x),2);
yp = a(1)*xp+a(2);
plot(x,y,'o',xp,yp)
grid on
end