clear, clc

Gc = [986.63 986.63 986.63 986.63 986.63];
Tc = [18 18 18 18 18];

sim('Zadatak_33')

figure(1)
plot(U, I, 'LineWidth', 1.5)
grid on
xlim([0 200])
ylim([0 9])
xlabel('U [V]')
ylabel('I [A]')

figure(2)
plot(U, U.*I, 'LineWidth', 1.5)
grid on
xlim([0 200])
ylim([0 1200])
xlabel('U [V]')
ylabel('P [W]')
