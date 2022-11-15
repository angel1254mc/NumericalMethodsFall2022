% This script uses linear least squares to find the line of best fit. Specifically, it finds
% the line of best fit, parabola/power function of best fit, and exponential curve of best fit

% First, I'll set my functions for calculating the linear least squares 

data = load("hw7_p3.mat");
y = data.nickel;
x = data.time;

[x_new, sortIndex] = sort(x);
y_new = y(sortIndex);
x = x_new';
y = y_new';
displacement = -x(1) + 1;
x = x + displacement;
[a_bar_1, r1] = regression_line(x,y);
[a_bar_2, r2] = regression_line(log10(x),log10(y)); % Power/Parabola
[a_bar_3, r3] = regression_line(x,log(y)); % Exponential
smooth_x = x(1):0.1:x(10);
plot(x,y);
hold on;
grid on;
plot(x,y,'o');
% Lines of best fit, line, parabola, and power
plot(smooth_x, a_bar_1(1) + a_bar_1(2)*smooth_x);
plot(smooth_x, (10^a_bar_2(1))*(smooth_x).^a_bar_2(2));
plot(smooth_x, exp(a_bar_3(1))*exp(smooth_x.*a_bar_3(2)));

legend('', 'Original Data Points', 'Line', 'Power/Parabola', 'Exponential');
xlabel('Time Since 7.9429e+05 years ago');
ylabel('% Concentration of Nickel');
title('% Concentration of Nickel vs Time');
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