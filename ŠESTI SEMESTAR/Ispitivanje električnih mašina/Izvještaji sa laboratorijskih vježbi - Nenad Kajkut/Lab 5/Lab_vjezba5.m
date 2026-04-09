% clear all
% close all
clc

%Rezultati ogleda praznog hoda
Ia = [0.22 0.42 0.62 0.84 1.01 2 3.05 4.03 5.03 6.12 7.06 8.09]; %Vektor armature struje pri UI metodi mjerenja otpornosti
Ua = [0.619 1.182 1.705 2.28 2.71 4.86 6.8 8.86 10.95 13.05 14.7 16.82]; %Vektor armaturnog napona pri UI metodi mjerenja otpornosti
Ia0 = [0.29 0.3 0.32 0.32 0.33 0.33 0.34 0.35 0.36 0.37 0.38 0.39 0.4 0.41 0.42]; %Vektor armaturne struje u ogledu motorskog PH GJS
Ua0 = [40.3 60.3 81.1 100.3 122.2 141.3 160.1 180.4 199 220 240 260 280 300 321]; %Vektor armaturnog napona u ogledu motorskog PH GJS
n = [191.5 289.4 392.8 489.8 596.6 698.6 796.7 888.3 985 1091 1190 1287 1386 1491 1591]; %Vektor izmjerene brzine obrtanja
Pgub = [11.41 17.8 25.62 31.77 39.98 46.28 54.07 62.75 71.23 80.97 90.75 100.93 111.51 122.49 134.29]; %Vektor snage gubitaka PFe+Pfv
Ra20 = Ua./Ia;
Ra75 = Ra20.*((235+75)/(235+20));

%Crtanje zavisnosti Ra75=f(Ia)
% figure(1)
% plot(Ia, Ra75, 'r*')
% grid on
% hold on
% x=0.1:0.01:9;
% y=2+0.24./x+exp(-0.09*x);
% plot(x, y, 'LineWidth', 1.5)
% xlabel("Ia [A]")
% ylabel("Ra75 [Ω]")
% title('Ra75 = f(Ia)')

%Crtanje zavisnosti Ra20=f(Ia)
% figure(2)
% plot(Ia, Ra20, 'r*')
% grid on
% hold on
% x = 0.1:0.01:8.1;
% y = 1.5+0.2362./x+exp(-0.077779*x);
% plot(x, y, 'LineWidth', 1.5)
% x=0:0.01:9;
% for k = 1:1:901
%     y(1, k) = 2.08;
% end
% plot(x, y, 'LineWidth', 1.5)
% xlabel("Ia [A]")
% ylabel("Ra20 [Ω]")
% title('Ra20 = f(Ia)')

%Crtanje karakteristike gubitaka PH GJS (Pfv + PFe = f(n))
figure(3)
plot(n, Pgub, 'r*')
grid on
hold on
x=0:1:1600;
p = polyfit(n, Pgub, 2);
y = polyval(p, x);
plot(x, y, 'LineWidth', 1.5)
xlabel("n [o/min]")
ylabel("Pfv + PFe [W]")
title('Pfv + PFe = f(n)')

beta = [0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9 0.95 1.0 1.05 1.1 1.15 1.2 1.25];
eta = [71.76 73.66 75.21 76.48 77.54 78.42 79.17 79.8 80.33 80.79 81.17 81.49 81.77 81.99 82.18 82.34 82.47 82.57];

%Crtanje karakteristike η=f(β)
figure(4)
plot(beta, eta, 'r*')
grid on
hold on
x=0.4:0.01:1.25;
y=interp1(beta, eta, x, 'spline');
plot(x, y, 'LineWidth', 1.5)
xlabel("β = Ia/Ian")
ylabel("η [%]")
xlim([0, 1.5])
ylim([0, 100])
title('η = f(β)')