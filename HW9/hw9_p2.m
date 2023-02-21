% This script uses Euler's method and the classical fourth-order
% Runge-Kutta method to solve the following differential equation
% from x=0 to x=10

% dy/dx = x - y
% y(0) = 0
% h (step size) = 2

% Euler Method First
y_0 = 0;
h = 2;
x = 0:2:10;
y = [y_0];
for i = 1:(length(x)-1)
   dy = x(i)-y(i);
   y(i+1)  = y(i) + h * dy;
end

plot(x, y, '-o', 'LineWidth',2);
hold on;

% Now we try Runge Kutta
y_rk = [y_0];
for i = (1:length(x)-1)
    k1 = x(i) - y_rk(i);
    k2 = (x(i) + 1/2*h)-(y_rk(i) + 1/2 *k1 * h);
    k3 = (x(i) + 1/2*h) - (y_rk(i) + 1/2 *k2 * h);
    k4 = (x(i) + h) - (y_rk(i) + k3*h);
    y_rk(i+1) = y_rk(i) + 1/6*(k1 + 2*k2 + 2*k3 + k4)*h;
end

plot(x, y_rk, '-o', 'LineWidth', 2);

% Finally, plot the actual analytic solution
x_detailed = 0:0.1:10;
y_actual = exp(-x_detailed(:)) + x_detailed(:) - 1;

plot(x_detailed, y_actual, 'LineWidth', 2)
xlabel("X values");
ylabel("Solution Y values");
title("Comparison of Integration Methods Y values vs. X values");
legend("Euler's Method", "RK Fourth Order", "Analytical Solution");