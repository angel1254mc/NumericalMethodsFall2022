function [ x ] = gauss_elim( A, b )
    %%gauss_elim uses Gauss elimination with partial pivoting to solve Ax = b
    %%Inputs:  A - A matrix
     %         b - b vector
    %%Outputs: x - solution to Ax = b
    %%Author: Angel Lopez Pol, University of Florida
        
        % Gotta remember A(row, col);]
        % Getting the dimensions of the matrix
        % I'm also gonna combine A and b, to perform the row operations on both A and B
        A = [A b];
        matrix_sizes = size(A);

        for  i=1:(matrix_sizes(2)-2) % for each column except the last
            [ index, max ] = find_max_in_col(i, i, A, matrix_sizes(1)); % Go over each row and find the max in that column
            % Then, swap rows and make calculations
            % Remember, column index also corresponds to current row index
            A([i, index], :) = A([index, i], :); % swap rows
            % Now, the rows that will be affected are all rows from i+1 to dimensions(1)
            % We calculate the row thingy
            R_m = i; % R_m is our factor row
            for j=(i+1):1:matrix_sizes(1)
                % So Row_n = Row_n - (val at row(j, i))/max * Row_(i, :)
                % Note - I doesn't change within this loop
                A(j, :) = A(j, :) - (A(j,i)/max).*A(i, :);
            end
            % Jesus Christ this is so easy by hand but so confusing from Matlab syntax perspective.
        end
        x = A(:, matrix_sizes(1));
        % Its time for the hard part
        % I'll have a separate function that implements back substitution
        x = back_sub_matrix(A);
    end


    function [ index, max_val ] = find_max_in_col(col_index, starting_row, A_matrix, row_length)
    col_of_interest = A_matrix(starting_row:1:row_length, col_index);
        [max_val, index] = max(abs(col_of_interest));
        max_val = col_of_interest(index);
        index = starting_row + index - 1; % I suppose this works lol

    end
    function [solutions] = back_sub_matrix(A)
        dims = size(A);
        solutions = zeros(dims(1), 1);
        % For each solution starting from the nth solution
        n = dims(1);
        for i = n:-1:1
            % I need to find the solution at i, using the constant at i
            % (b_i), the factor (a_i) which we divide with, and the
            % corresponding factors and solutions for i+1:1:n
            prev_sol_sum = 0;
            for j = (i+1):1:n
                prev_sol_sum = prev_sol_sum + solutions(j)*A(i, j);
            end
            solutions(i) = (A(i, dims(2)) - prev_sol_sum)/A(i,i);

        end
        
    end