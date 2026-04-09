% clear all
% close all
clc

%Rezultati ogleda kratkog spoja
Ik = [0 1.5 2.05 3 4.05 4.95 6]; %Vektor struje kratkog spoja
Uk = [0 30 40 57.5 76 91.5 111]; %Vektor napona kratkog spoja
Pk = [0 40 70 150 290 420 640]; %Vektor snage kratkog spoja

%Rezultati ogleda praznog hoda
I0 = [3.75 3.3 2.975 2.65 2.45 2.2 1.705 1.28 0.915 0.595 0.42]; %Vektor struje praznog hoda
U0 = [400 380 360 340 320 300 250 200 150 100 81]; %Vektor napona praznog hoda
P0 = [240 195 180 135 135 120 80 60 35 20 20]; %Vektor snage praznog hoda
Pcus0 = [131.2 101.6 82.58 65.52 56 45.16 27.12 15.29 7.81 3.3 1.65]; %Vektor gubitaka u bakru namoraja statora u ogledu praznog hoda
PFefv = P0 - Pcus0; %Vektor snage gubitaka PFe + Pfv
U02 = U0.^2; %Vektor kvadrata napona praznog hoda

% Crtanje karakteristike Pk = f(Uk)
% figure(1)
% plot(Uk, Pk, 'r*')
% grid on
% hold on
% x=0:0.01:120;
% p = polyfit(Uk, Pk, 2);
% y = polyval(p, x);
% plot(x, y, 'LineWidth', 1.5)
% xlabel("Uk [V]")
% ylabel("Pk [W]")
% title('Pk = f(Uk)')
%
% Crtanje karakteristike Ik = f(Uk)
% figure(2)
% plot(Uk, Ik, 'r*')
% grid on
% hold on
% x=0:0.01:120;
% p = polyfit(Uk, Ik, 2);
% y = polyval(p, x);
% plot(x, y, 'LineWidth', 1.5)
% xlabel("Uk [V]")
% ylabel("Ik [A]")
% xlim([0, 120])
% ylim([0, 7])
% title('Ik = f(Uk)')

% Crtanje karakteristike I0 = f(U0)
% figure(3)
% plot(U0, I0, 'r*')
% grid on
% hold on
% x=0:0.01:400;
% p = polyfit(U0, I0, 2);
% y = polyval(p, x);
% plot(x, y, 'LineWidth', 1.5)
% xlabel("U0 [V]")
% ylabel("I0 [A]")
% title('I0 = f(U0)')

% Crtanje karakteristike PFe + Pfv = f(U0)
figure(4)
plot(U0, PFefv, 'r*')
grid on
hold on
x=0:0.01:400;
p = polyfit(U0, PFefv, 2);
y = polyval(p, x);
plot(x, y, 'LineWidth', 1.5)
xlabel("U0 [V]")
ylabel("PFe + Pfv [W]")
title('PFe + Pfv = f(U0)')

% Crtanje karakteristike PFe + Pfv = f(U0^2)
% figure(5)
% plot(U02, PFefv, 'r*')
% grid on
% hold on
% x=0:0.01:160000;
% p = polyfit(U02, PFefv, 1);
% y = polyval(p, x);
% plot(x, y, 'LineWidth', 1.5)
% xlabel("U0^2 [V^2]")
% ylabel("PFe + Pfv [W]")
% title('PFe + Pfv = f(U0^2)')