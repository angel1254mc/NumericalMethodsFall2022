% This function has the purpose of calculating the intersection of a system of three
% non-linear ODE's by utilizing Newton Raphson Method. I'll use true relative error of like 10^-6 as my stopping criterion
x = [0; 0; 0];
f_x = [];
v = 0;
calc_err = 1000000; % 1 morbillion error for the start otherwise while loop doesn't run
while calc_err >= 10^-6
    f_x  = [f_1(x); f_2(x); f_3(x)];
    J_delt = J_delta(x);
    x_new = x - (J_delt\f_x); % Inshallah the inner machinations of my mind will yield the solution
    calc_err = abs(x_new-x);
    x = x_new;
    v = v + 1;
end
fprintf("The height of the explosion is: %g units in the x3 direction\n", x(3))

function [f1] = f_1(x)
    f1 = x(1)^2 + x(2)^2 -x(3) - 1500;
end
function [f2] = f_2(x)
    f2 = x(1)^2 + (x(2)-5)^2 - x(3) -1600;
end
function [f3] = f_3(x)
    f3 = (x(1)-3)^2 + (x(2) + 8)^2 - x(3) -2200;
end

function [jacobian] = J_delta(x)
    jacobian = [
        2*x(1), 2*x(2), -1;
        2*x(1), 2*x(2) - 10, -1;
        2*x(1)-6, 2*x(2) + 16, -1
    ];
end