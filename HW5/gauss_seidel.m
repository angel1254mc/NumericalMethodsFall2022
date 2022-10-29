function [ x, n ] = gauss_seidel( A, b, x0, lambda )
    %%gauss_seidel uses the Gauss-Seidel method to solve Ax = b
    %%Inputs: A - A matrix
     %        b - b vector
     %        x0 - initial guess
     %        lambda - relaxation parameter
    %%Outputs: x - solution to Ax = b
     %         n - number of iterations required
    %%Author: Angel Lopez Pol, University of Florida
    cont = true;
    tolerance = 10^-6;
    dims = size(A);
    % Note: x0 is a column vector!
    % The amount of iterations will be denoted k
    k = 0;
    % For gauss seidel, we continuously use the newest values we have available, and we test for convergence
    % After going through each iteration of "k". We stop once all of our values converge, not just one
    while cont
        k = k + 1; % We start at the 1st iteration
        x0_old = x0;
        for i=1:dims(1)
            new_x0 = ( b(i) - sum(x0(1:(i-1)).*(A(i, 1:(i-1)).'), 'all') - sum(x0((i+1):dims(1)).*(A(i, (i+1):dims(1)).'), 'all' ))/A(i,i);
            x0(i) = relax_guess(new_x0, x0(i), lambda);
        end
        % By now, all new guesses should have been computed, so we can calculate error
        cont = ~met_stop_crit(x0, x0_old, tolerance);
    end
    x = x0;
    n = k;
end
function [relaxed] = relax_guess(new, old, lambda)
    % This function relaxes our guess using by a factor of lambda
    relaxed = lambda*new + (1-lambda)*old;
end

function [stop] = met_stop_crit(new, old,tolerance)
    % This function calculates the error by checking whether each of the values
    % in the guess arrays are converging. If they are, it returns true
    % If they are not, returns false.

    errors = abs((new(:)-old(:))./new(:))*100;
    dims2 = size(errors);
    % For all errors, if one of them is greater than tolerance, continue
    % Otherwise stop
    for i = 1:dims2(1)
        if (errors(i) >= tolerance)
            stop = false;
            return
        end
    end
    stop = true;
end

function [Anew, bnew] = preprocess( A, b )
    % Altered to only pivot!
        
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
        Anew = A(:, 1:matrix_sizes(1));
        bnew = A(:, matrix_sizes(1) +1);
        % Its time for the hard part
        % I'll have a separate function that implements back substitution
end


function [ index, max_val ] = find_max_in_col(col_index, starting_row, A_matrix, row_length)
    col_of_interest = A_matrix(starting_row:1:row_length, col_index);
        [max_val, index] = max(abs(col_of_interest));
        max_val = col_of_interest(index);
        index = starting_row + index - 1; % I suppose this works lol

end
