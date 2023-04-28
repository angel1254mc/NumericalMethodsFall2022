some_data = load("hw9_p1.mat");

%{ 
    The lagrange polynomial is calculated by constructing an nth-degree polynomial 
    that passes thru all of the (x,y) value pairs provided 🤓. The formula is relatively shrimple
    but it can be confusing to implement in code
%}
    

% Let's make a function that actually "draws out" or "plots" this lagrange polynomial
% We can do this by determininng an interval that we want to plot over, which in this case
% would just be the interval from [lowest x value, highest x value]
function [x, y] = lagrange_plot(x, y, plot_start, plot_end)

    data_length = length(x);
    % What is the interval we are plotting over? plot_start to plot_end, with a bunch of small steps in between
    interval_of_plot = plot_start:0.01:plot_end;
    P = zeros(length(interval_of_plot), 2) % P is going to be a matrix with 2 columns, and n rows, where the columns  correspond to x and y respectively

    % For each x value that we are plotting, use the lagrange polynomial to get the y_value
    for n = 1:length(interval_of_plot)
        % Inside here, let's calculate out the actual polynomial that we are putting our x values in
        
        % To calculate the lagrange polynomial, we need to use the x and y values that we get from the data
        % in this case its the values we get from loading hw9_p1.mat
        
        % See the following link for an explanation on how Lagrange Polynomials work https://mathworld.wolfram.com/LagrangeInterpolatingPolynomial.html

        % Let's think about the steps needed, using for loops, to calculate out the actual P(x) = bla bla bla formula
        % We can kind of think of lagrange polynomials lookin something like this

        % P = (something related to x1)y1 + (something related to x2)y2 + ... + (something related to xn)yn
        % This "something related to xn" can also be represented as the following

        % (x - x2)...(x - xn)/((x1 - x2)(x1 - x3))

        % We do this for each x value in our array of x values that we get from our intitial data
        % Note how for x1, (x-x1) is not present in the top. This goes for all xi, (x - xi) won't be present in the fraction!

        % Setting up our x value
        P(n, 1) = interval_of_plot(n)
        
        for i = 1:length(x)

            % Calculate the numerator of (something related to xi)
            numerator =1;
            denominator=1;
            % an additional inner loop
            for (j = 1:length(x))
                % Only calculate for everything that is not xi
                % numerator = numerator*(stuff) This is like (x - xi) * (x - x(i+1)) * (x - x(i+2))...
                % denominator = denominator*(stuff) This is like (x1 - x2) * (x1 - x3) ...
                if (j != i)
                    numerator = numerator*(P(n, i) - x(j))
                    denominator = denominator(x(i) - x(j))
                end
                
            end
            P(n, 2) = P(n, 2) + numerator/denominator*y(i);

        end
    end

    plot(P(:, 1), P((:, 2)))
    hold on;
    plot(x, y)

end