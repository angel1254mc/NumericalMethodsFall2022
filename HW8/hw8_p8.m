load("hw8_p8.mat");
% Same as in hw8_p7, but we do not need to adjust for weeks
Y = fft(y);
N = length(y);

k = 0:(N-1);
T = N*1;

freq = k/T; 
% We are set, now we can plot
stem(freq, abs(Y));

xlabel('Hz');
ylabel('Magnitude');
title('Magnitude vs Frequency (Hz)');