function [ L, U, P ] = lu_fact( A )
    %lu_fact performs LU factorization with partial pivoting
    %Input:   A - A matrix to be factored
    %Outputs: L - lower-triangular matrix
    %         U - upper-triangular matrix
    %         P - permutation matrix associated with pivots
    %Author: Ms./Mr. Gator, University of Florida
        
    % This is basically like Gauss Elimination but recording our steps in a separate set of matrices
    % First I'll make my L,U, and P matrices
    dims = size(A);
    U = A;
    P = zeros(dims(1),dims(2));
    L = zeros(dims(1), dims(2));
    % Going to assume A is always a square matrix
    for i = 1:dims(1)
        P(i, i) = 1;
        L(i, i) = 1;
    end

    % Now, I can begin the Gauss Elimination steps
    for i = 1:dims(2)-1
        [index, max ] = find_max_in_col(i, i, U, dims(1));
        % Then, swap rows for the following:
        % U
        U([i, index], :) = U([index, i], :);
        % P
        P([i, index], :) = P([index, i], :);
        % L, only if possible, meaning only if our swaps aren't past the diagonal!
        % For each column j, the swap is possible if both numbers are below the row j (i > j && index > j)
        for j = 1:dims(2)
            if (i > j && index > j)
                L([i, index], j) = L([index, i], j);
            end
        end
        % Now, perform the subtraction on U, save the Factor on L
        for j = (i+1):dims(1)
            % Saving factor to each row of L
            L(j, i) = U(j,i)/max;
            % Subtraction on U
            U(j, :) = U(j , :) - (U(j, i)/max).*U(i,:); 
        end

    end
    % By the end of this entire process, we should have L, U, and P 
    % matrices that match the written portion of the homework
end

% This function stays the same pretty much
function [ index, max_val ] = find_max_in_col(col_index, starting_row, A_matrix, row_length)
    col_of_interest = A_matrix(starting_row:1:row_length, col_index);
        [max_val, index] = max(abs(col_of_interest));
        max_val = col_of_interest(index);
        index = starting_row + index - 1; % I suppose this works lol

    end