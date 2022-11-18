clc; clear;

data = load("hw7_p4.mat");
ingreds = data.ingreds;
ratings = data.participant_ratings;
% We are going to have 6 coefficients- one for the constant and 5 for the
% ingredients

% Additionally, we need to treat each person's rating as a separate data
% point. This will result in multiple y values for the same recipe but
% this is ok, we can still get a best-fit hyperplane for this!
% I also need to organize the ratings into something that I can liken to
% y=Za + e, so I'll turn it into a big column composed of all the columns
% in the matrix stacked up on one another

% I can do this with the reshape function
ratings = reshape(ratings, [], 1);
% Now I have 1 column! indexes 1-10 correspond to recipes 1 thru 10 ratings
% from person 1, and 11-20 is the same but for person 2. Hence, Ill repeat
% the Z matrix 100 times to be able to match the dimensions
ingreds = repmat(ingreds, [100, 1]);

% Now, I have an 1000x1 for ratings, and 1000x5 for ingredients. Now I can
% use my linear regression function :)
[a_bar, r_squared] = multivariable_linear_regression(ingreds, ratings);
% We should now have our a bar, with a coefficient for constants, and 5 for
% each ingredient!
fprintf("The coefficients obtained for our best-fit curve for the cookies can be found below: \n");
disp(a_bar)


function [a_bar, r_squared] = multivariable_linear_regression(x, y)
    Z = [ones(size(x(:,1))) x(:,1) x(:,2) x(:,3) x(:,4) x(:,5)];
    a_bar = (Z'* Z)\(Z' * y);

    Sr = sum((y-Z*a_bar).^2);
    r_squared = 1 - Sr/sum((y-mean(y)).^2);
    syx = sqrt(Sr/(length(x)-length(a_bar)));
end
