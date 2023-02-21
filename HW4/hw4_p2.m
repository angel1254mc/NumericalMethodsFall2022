clc; clear;
% This script implements the gradient descent method
% to find the minimum of 10(x_1^2) + 10*(x_2^2), as well as
% that of f(x) = (x_1)^2 + 10*(y_2)^2.

% Our starting guess will be x^(0) = [420, 68]
v_i = [420, 68];
v_i2 = [420, 68];
% End criteria is the magnitude of the gradient is less than 10^-6
disp("Performing Gradient Descent on function 1 w/ initial values [420, 68] yields the following minima")
[vec1, iterations1] = GradientDescent(v_i);
disp(vec1);
disp("Amount of iterations: ");
disp(iterations1);

disp("Performing Gradient Descent on functio 2 w/ initial values [420, 68] yields the following minima")
[vec2, iterations2] = GradientDescent2(v_i2);
disp(vec2);
disp("Amount of iterations: ");
disp(iterations2);

function [vec, iterations] = GradientDescent(v_x)
    iterations = 0;
    while (norm(f_gradient(v_x)) >= 10^-6)
        v_x = descend(v_x);
        iterations = iterations + 1;
    end
    vec = round(v_x, 6);
end

function [z] = f_x(v_x)
    z = 10* v_x(1)^2 + 10*v_x(2)^2;
end
function [partial_dx] = f_gradient(v_x)
    dx1 = 20*v_x(1);
    dx2 = 20*v_x(2);
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


function [vec, iterations] = GradientDescent2(v_x)
    iterations = 0;
    while (norm(f_gradient2(v_x)) >= 10^-6)
        v_x = descend2(v_x);
        iterations = iterations + 1;
    end
    vec = round(v_x, 6);
end

function [z] = f_x2(v_x)
    z = v_x(1)^2 + 10*v_x(2)^2;
end
function [partial_dx] = f_gradient2(v_x)
    dx1 = 2*v_x(1);
    dx2 = 20*v_x(2);
    partial_dx = [dx1 dx2];
end
function [v_new] = descend2(v_x)
    partial_dx = -1*f_gradient2(v_x);
    t=1;
    while f_x2([(v_x(1)+t*partial_dx(1)) (v_x(2) + t*partial_dx(2))]) >= f_x2(v_x)
        t = 0.5*t;
    end
    v_x(1) = v_x(1) + t*partial_dx(1);
    v_x(2) = v_x(2) + t*partial_dx(2);
    
    v_new = [v_x(1) v_x(2)];
end