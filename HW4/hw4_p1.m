clc; clear;
% This script displays an implementation of Newton's Method of Optimization
% to find the minimum of the function f(x) = 2x^2 -3x + 5
% I will use |f'(x)| < 10^-6 as the stopping criterion
% Made by Angel Lopez on 10/14/2022

% I'm going to set up my equation as a set of "functions", so that if I
% have to perform another optimization method, I can just change  what's
% inside of each "f(x), f'(x), and f''(x)" function to what it should be.

% These will be my initial guesses

x_1 = pi^-1;
x_2 = 9000.1;
x_3 = 4500.05;

% Newton Optimiation with the three initial guesses
disp("Using Newton's Optimization Method with 3 initial guesses: ")
disp(NewtonOptim(x_1));
disp(NewtonOptim(x_2));
disp(NewtonOptim(x_3));
% Now, using Newton Raphson
disp("Using Newton Raphson Method with 3 initial guesses: ");
disp(NewtonRaphson(x_1));
disp(NewtonRaphson(x_2));
disp(NewtonRaphson(x_3));

function [minimum] = NewtonOptim(x_i)
    while (abs(f_prime_x(x_i)) >= 10^(-6))
        delta_x =  -(f_prime_x(x_i)/f_dub_prime(x_i));
        t = 1;
        while f_x(x_i - t*(f_prime_x(x_i)/f_dub_prime(x_i))) >= f_x(x_i)
            t = 0.5*t;
        end
        x_i  = x_i + t*delta_x;
    end
    minimum = x_i;
end
function [minimum] = NewtonRaphson(x_i)
    while (abs(f_prime_x(x_i)) >= 10^(-6))
        x_i = x_i - f_x(x_i)/f_prime_x(x_i);
    end
    minimum = x_i;
end

function [y] = f_x(x)
    y = 2*x^2 - 3*x + 5; 
end

function [y_prime] = f_prime_x(x)
    y_prime = 4*x - 3;
end
function [y_dub_prime] = f_dub_prime(x)
    y_dub_prime = 4*x/x;
end
