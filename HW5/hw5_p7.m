% Using Matlab to solve the following two systems
A1 = [2, 2, 0 3; 0 0 2 1; 0 1 0 0; 1 0 1 0];
b1 = [29; 5; 8; 3;];

A2 = flip(A1, 1);
b2 = flip(b1, 1);

% Going to use left division to accomplish this;

result1 = A1\b1;
result2 = A2\b2;

fprintf("Result from System 1: \n");
disp(result1);
fprintf("Result from System 2: \n");
disp(result2);

% These two systems yield the same results because system 2 will pivot over and over again
% until it looks like system 1, meaning that in the end both systems will yield the same result.