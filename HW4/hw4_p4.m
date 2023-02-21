clc; clear;
% This script finds the most suitable landing zone on the moon
% using multivariate gradient message. The function that suitability of any coordinate on the moon
% is the following:
% f(x) = (x1 - 3)^2 + x2^4 - 3log(2x1+5x2+50)

% I will use most of the code that I used to solve hw4_p2, just changing the function-specific
% matlab functions to reflect the change in f(x);
% I'll just use 10, 10 as my initial x vector;
v_i = [10, 10];
disp("Coordinates (east-west in miles, north-south in miles) of most suitable landing location")
disp("Using Gradient Descent Method: ")
[vec1, iterations1, obj_val] = GradientDescent(v_i);
disp(vec1);
disp("Amount of iterations: ");
disp(iterations1);
disp("Objective Value (Smaller = Better)")
disp(obj_val);

function [vec, iterations, val] = GradientDescent(v_x)


    iterations = 0;
    while (norm(f_gradient(v_x)) >= 10^-6)
        v_x = descend(v_x);
        iterations = iterations + 1;
    end
    vec = round(v_x, 6);
    val = f_x(vec);
end

function [z] = f_x(v_x)
    z = (v_x(1) - 3)^2 + v_x(2)^4 - 3*log(2*v_x(1) + 5*v_x(2) + 50);
end
function [partial_dx] = f_gradient(v_x)
    dx1 = 2*(v_x(1) - 3) - 6/(2*v_x(1) + 5*v_x(2) + 50);
    dx2 = 4*v_x(2)^3 - 15/(2*v_x(1) + 5*v_x(2) + 50);
    partial_dx = [dx1 dx2];
end
function [v_new] = descend(v_x)
    partial_dx = -1*f_gradient(v_x);
    t=1;
    while f_x([(v_x(1)+t*partial_dx(1)) (v_x(2) + t*partial_dx(2))]) >= f_x(v_x)
        t = 0.5*t;
    end
    v_x(1) = v_x(1) + t*partial_dx(1);
    v_x(2) = v_x(2) + t*partial_dx(2);
    
    v_new = [v_x(1) v_x(2)];
end