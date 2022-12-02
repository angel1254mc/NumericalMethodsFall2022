clear;

% We are basically doing the same thing but with hw8_p7.mat instad
load("hw8_p7.mat");
% daily cases will be our y values, and we will evaluate this fft taking
% each day as a x-value
Y = fft(daily_cases);
N = length(daily_cases);

k = 0:(N-1);
T = N*1; % 1 for dt since we are evaluating at every day

freq = 7*k/T; % account for there being 7 days in a week

% We are set, now we can plot
stem(freq, abs(Y));
xlim([0 3.5]); % Mirrored at 3.5
xlabel('cycles/week');
ylabel('Covid Cases');
title('Covid Cases by frequency of appearance');