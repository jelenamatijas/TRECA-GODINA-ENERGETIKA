%Otpornik za max snagu reda modula, sa i bez premoscavajuce diode

Tc=[30 30 30 30 30];
Gc=[1000 1000 1000 1000 400];

sim('Moduli.slx')

figure(1)
plot(U, I, 'LineWidth', 2)
grid on
xlim([0, 120])
ylim([0, 3.5])

figure(2)
plot(U, U.*I, 'LineWidth', 2)
grid on
xlim([0, 120])
ylim([0, 200])
