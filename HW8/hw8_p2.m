% This script tests the square_fourier function

plot(0:0.001:10, square_fourier(2,1,0:0.001:10));
hold on;
plot(0:0.001:10, square_fourier(10,1,0:0.001:10));
plot(0:0.001:10, square_fourier(100,1,0:0.001:10));
plot(0:0.001:10, square_fourier(1000,1,0:0.001:10));
title("Magnitude vs. Time");
xlabel("Time");
ylabel("Magnitude");
legend('2 Frequencies', '10 Frequencies', '100 Frequencies', '1000 Frequencies');