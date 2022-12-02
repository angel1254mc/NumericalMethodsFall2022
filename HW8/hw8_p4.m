% This function plots 3 curves in the same plot in matlab
% Made by Angel Lopez Pol

t = 0:0.05:(8*pi);
y1 = 0.1*sin(0.25*t);
y2 = 0.01*sin(5*t);
y3 = y1 + y2;

plot(t,y1);
hold on;
plot(t,y2);
plot(t,y3);
hold off;
legend("y1", "y2", "y3");
xlabel("Time (s)");
ylabel("Values");
title("Values vs. Time");