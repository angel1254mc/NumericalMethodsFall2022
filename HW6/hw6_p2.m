t = 0:0.001:15;
%x1 corresponds to Naren
%x2 corresponds to Felicity
x1 = 0.5*exp((0.1+sqrt(-0.5))*t) + 0.5*exp((0.1-sqrt(-0.5))*t);
x2 = 0.5*sqrt(-0.5)*exp((0.1+sqrt(-0.5))*t)-0.5*sqrt(-0.5)*exp((0.1-sqrt(-0.5))*t);
figure(1);
hold on;
plot(x2, x1);
title("Naren (N(t)) vs. Felicity (F(t))");
xlabel("F(t) (Love Units)");
ylabel("N(t) (Love Units)");
hold off;

figure(2);
plot(t, x1);
hold on;
plot(t, x2);
title("Naren and Felicity (Love Units) vs. Time (days??? years???)");
legend(["Naren", "Felicity"]);
xlabel("Time");
ylabel("Love");
hold off;