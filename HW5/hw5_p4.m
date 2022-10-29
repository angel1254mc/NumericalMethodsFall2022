% In this script, we use MATLAB's lu function to get the L, U , and P matrices
% for the matrix A. We can then use these matrices to calculate b, only using
% Forwards and Backwards Substitution
A = [2, 2, 0 3; 0 0 2 1; 0 1 0 0; 1 0 1 0];
% Using the matrix from problem 7 of hw4
[L, U, P] = lu(A);
b = [29; 5; 8; 3;];
% Now that we have L, U, and P, we can first find our "d" by using  Ld = Pb
% Then, we can find our x by using Ux = d

% I'm going to need to perform forward_sub, and back_sub, so I'll make functions for each
% Now I can use the forward sub and backwards sub functions w/ my values
d = forward_sub([L P*b]);
b = backwards_sub([U d]);

% Display the result for me to confirm it's correct.
fprintf("Final answer using LU factorization: \n");
disp(b);


function [solution] = backwards_sub(A)
    dims = size(A);
    solution = zeros(dims(1), 1);
    n = dims(1);
    for i = n:-1:1
        % I need to find the solution at i, using the constant at i
        % (b_i), the factor (a_i) which we divide with, and the
        % corresponding factors and solutions for i+1:1:n
        prev_sol_sum = 0;
        for j = (i+1):1:n
            prev_sol_sum = prev_sol_sum + solution(j)*A(i, j);
        end
        solution(i) = (A(i, dims(2)) - prev_sol_sum)/A(i,i);

    end
end

function [solution] = forward_sub(A)
    dims = size(A);
    solution = zeros(dims(1), 1);
    n = dims(1);
    for i = 1:1:n
        % I need to find the same thing as backwards sub, expect going from top to bottom
        % This is pretty easy to implement
        prev_sol_sum = 0;
        for j = (i-1):-1:1
            prev_sol_sum = prev_sol_sum + solution(j)*A(i, j);
        end
        solution(i) = (A(i, dims(2)) - prev_sol_sum)/A(i,i);
    end
end