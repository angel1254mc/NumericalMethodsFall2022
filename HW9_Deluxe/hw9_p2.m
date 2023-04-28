some_data = load("hw9_p1.mat");
x_old = some_data.x;
n = length(x_old);
x_new = x_old(1):0.001:x_old(n);


y_new = spline(x_old, some_data.y, x_new);

plot(x_new, y_new);
hold on;
plot(x_old, some_data.y);