Tc=[30 30 30 30 30];
Gc=[1000 1000 1000 1000 400];

sim('zadatak3.slx')

figure(1)
plot(U, I, 'LineWidth', 2)
xlim([0, 120])
ylim([0, 1.6])
grid on

figure(2)
plot(U, U.*I, 'LineWidth', 2)
xlim([0, 120])
ylim([0, 120])
grid on
