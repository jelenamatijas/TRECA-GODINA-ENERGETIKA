%crtanje UI karakteristika PV celije pri T=25, G=1000, 700 i 400 W/m2

G=0.001;
Isc=1;
k=1.38e-23;
q=1.602e-19;
Rp=6.6;
Rs=0.005;

Gc=1000;
sim('PVcelija.slx')
figure(1)
plot(Upv, Ipv, 'LineWidth', 2)
xlim([0, 0.6])
ylim([0, 1.2])
grid on
hold on

Gc=700;
sim('PVcelija.slx')
plot(Upv, Ipv, 'LineWidth', 2)
hold on

Gc=400;
sim('PVcelija.slx')
plot(Upv, Ipv, 'LineWidth', 2)

legend('1000', '700', '400')