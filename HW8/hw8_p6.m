clc; clear; clf;

% The four different intervals are
t1 = 1:0.01:8*pi;
t2 = 1:0.01:12*pi;
t3 = 1:0.01:16*pi;
t4 = 1:0.01:60*pi;

% Getting the y values for y_3
y_1 = 0.1*sin(0.25*t1) + 0.01*sin(5*t1);
y_2 = 0.1*sin(0.25*t2) + 0.01*sin(5*t2);
y_3 = 0.1*sin(0.25*t3) + 0.01*sin(5*t3);
y_4 = 0.1*sin(0.25*t4) + 0.01*sin(5*t4);

% Getting the discrete FFT
Y_1 = fft(y_1);
Y_2 = fft(y_2);
Y_3 = fft(y_3);
Y_4 = fft(y_4);

% Now, we have our coefficients for each k! 
% These are the amplitudes of our sines and cosines,
% We need to obtain the element-wise magnitude of each Fk
% If we use Abs, we can get element-wise magnitude :)
% However we also need our frequencies, which we can nab
% using the formulas for lowest and highest observable (non-zero) frequencies
N1 = length(y_1);
N2 = length(y_2);
N3 = length(y_3);
N4 = length(y_4);

k1 = 0:(N1-1);
k2 = 0:(N2-1);
k3 = 0:(N3-1);
k4 = 0:(N4-1);

T1 = N1*0.01;
T2 = N2*0.01;
T3 = N3*0.01;
T4 = N4*0.01;

freq_1 = k1/T1;
freq_2 = k2/T2;
freq_3 = k3/T3;
freq_4 = k4/T4;
subplot(2,2,1)
stem(freq_1, abs(Y_1));
title("0 to 8pi");
xlim([0,1]);
xlabel('Hz')
subplot(2,2,2);
stem(freq_2, abs(Y_2));
title("0 to 12pi");
xlim([0,1]);
xlabel('Hz')
subplot(2,2,3);
stem(freq_3, abs(Y_3));
title("0 to 16pi");
xlim([0,1]);
xlabel('Hz')
subplot(2,2,4);
stem(freq_4, abs(Y_4));
title("0 to 60pi");
xlim([0,1]);
xlabel('Hz');

