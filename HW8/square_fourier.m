
% This function computes the fourier series for the square wae example 16.2 in the textbook,
% for which we calculated the coefficients in problem 1 of this homework
% Created by Angel Lopez Pol

function [y] = square_fourier(m, omega, t)
    flip = 1;
    y = 0;
    for k = 1:2:(m+1)
        % Using modulus instead of if statements for extra credit hehehehehe
        y = y + (mod(k,2))*(((mod(flip,2)-1)*-1 * -(4*cos(k*omega*t)/(k*pi)) + (mod(flip,2)*(4*cos(k*omega*t)/(k*pi) ))));
        flip = flip + mod(k,2)*1;
    end
end