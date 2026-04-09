Tc=[25 25];
Gc=[1000 100];
R=30;

sim('Lab3Vjezba.slx')

figure(1)
plot(U, I, 'LineWidth', 2)
grid on
xlim([0, 30])
ylim([0,7])