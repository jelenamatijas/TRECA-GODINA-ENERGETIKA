clc

Tc=[25 25];
Gc=[1000 100];

sim('vjezbaBD.slx')

plot(U, I1, 'Color', 'Blue')
grid on
xlim([0 22])
ylim([0 4])
hold on
plot(U, I2, 'Color', 'Red')
hold on
plot(U, I, 'Color', 'Green')
hold on
plot(U, U/30, 'Color', 'Black')
legend('1', '2', 'both', 'consumer')