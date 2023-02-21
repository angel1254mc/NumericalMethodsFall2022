% matlab functions to reflect the change in f(x);
% I'll just use 10, 10 as my initial x vector;

% This will be my initial guess
v_i = [10, 10];

[min_v, iterations, obj_val] = NewtonOptimMulti(v_i);
disp("The Minimum Point (x1, x2) in the function obtained from Newton's Method of Optimization")
disp(min_v);
disp("The amount of iterations the method took: ");
disp(iterations);
disp("Objective Value (Smaller = Better)")
disp(obj_val);

function [min_v, iterations, val] = NewtonOptimMulti(v_x)
    iterations = 0;
    while (norm(f_gradient(v_x)) >= 10^-6)
        v_x = newton_descend(v_x);
        iterations = iterations + 1;
    end
    min_v = round(v_x, 6);
    val = f_x(min_v);
end

function [z] = f_x(v_x)
    z = (v_x(1) - 3)^2 + v_x(2)^4 - 3*log(2*v_x(1) + 5*v_x(2) + 50);
end

function [partial_dx] = f_gradient(v_x)
    dx1 = 2*(v_x(1) - 3) - 6/(2*v_x(1) + 5*v_x(2) + 50);
    dx2 = 4*v_x(2)^3 - 15/(2*v_x(1) + 5*v_x(2) + 50);
    partial_dx = [dx1 dx2];
end

function [hessian] = f_hessian(v_x)
    double_partial_x1 = 2*v_x(1) + 12/(2*v_x(1) + 5*v_x(2) + 50)^2;
    double_partial_x2 = 12*v_x(2) + 75/(2*v_x(1)+5*v_x(2) + 50)^2;
    hessian = double_partial_x1*double_partial_x2 - 30/(2*v_x(1)+5*v_x(2)+50)^2; % No f_xy in this function - hessian is just double partials multiplied together
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