clc; clear;
% This script displays an implementation of Newton's Method of Optimization
% to find the minimum of the multivariate function f(x) = 2x^2 -3x + 5
% I will use |gradient (x)| < 10^-6 as the stopping criterion
% Made by Angel Lopez on 10/14/2022


% This will be my initial guess

v_i = [420, 68];
% Here I'm going to perform the multivariable Newton Optimization
[min_v, iterations] = NewtonOptimMulti(v_i);
disp("The Minimum Point (x1, x2) in the function obtained from Newton's Method of Optimization")
disp(min_v);
disp("The amount of iterations the method took: ");
disp(iterations);
function [min_v, iterations] = NewtonOptimMulti(v_x)
    iterations = 0;
    while (norm(f_gradient(v_x)) >= 10^-6)
        v_x = newton_descend(v_x);
        iterations = iterations + 1;
    end
    min_v = round(v_x, 6);
end

function [z] = f_x(v_x)
    z = v_x(1)^2 + 10*v_x(2)^2;
end

function [partial_dx] = f_gradient(v_x)
    dx1 = 2*v_x(1);
    dx2 = 20*v_x(2);
    partial_dx = [dx1 dx2];
end

function [hessian] = f_hessian(v_x)
    hessian = 2*20 - 0^2; % No f_xy in this function - hessian is just double partials multiplied together
end

function [v_new] = newton_descend(v_x)
    partial_dx = f_gradient(v_x);
    hessian = f_hessian(v_x);
    delta_v = -1*partial_dx./hessian;
    t = 1;

    while f_x([(v_x(1)+t*delta_v(1)) (v_x(2) + t*delta_v(2))]) >= f_x(v_x)
        t = 0.5*t;
    end

    v_x(1) = v_x(1) + t*delta_v(1);
    v_x(2) = v_x(2) + t*delta_v(2);
    v_new = [v_x(1) v_x(2)];
end