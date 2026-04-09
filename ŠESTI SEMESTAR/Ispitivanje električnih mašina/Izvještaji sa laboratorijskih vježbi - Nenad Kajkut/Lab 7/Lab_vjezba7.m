% clear all
% close all
clc

%Rezultati ogleda praznog hoda
Uf0 = [60.4 88.733 117.8 146.2 174.667 204.933 233.867 263.7]; %Vektor faznog napona praznog hoda
If0 = [0.031 0.042 0.056 0.073 0.098 0.144 0.219 0.35]; %Vektor fazne struje praznog hoda
P0 = [1 5 11 19 27 39 54 75]; %Vektor snage praznog hoda
mT = [1.261 1.246 1.25 1.243 1.255 1.247 1.249 1.25]; %Vektor prenosnog odnosa

% Crtanje karakteristike If0 = f(Uf0)
figure(1)
plot(Uf0, If0, 'r*')
grid on
hold on
x=0:0.001:270;
p = polyfit(Uf0, If0, 4);
y = polyval(p, x);
plot(x, y, 'LineWidth', 1.5)
xlabel("Uf0 [V]")
ylabel("If0 [A]")
xlim([0, 270])
ylim([0, 0.4])
title('If0 = f(Uf0)')

% Crtanje karakteristike P0 = f(Uf0)
figure(2)
plot(Uf0, P0, 'r*')
grid on
hold on
x=0:0.001:270;
p = polyfit(Uf0, P0, 2);
y = polyval(p, x);
plot(x, y, 'LineWidth', 1.5)
xlabel("Uf0 [V]")
ylabel("P0 [W]")
xlim([0, 270])
ylim([0, 80])
title('P0 = f(Uf0)')

% Crtanje karakteristike mT = f(Uf0)
figure(3)
plot(Uf0, mT, 'r*')
grid on
hold on
x=0:0.001:270;
p = polyfit(Uf0, mT, 1);
y = polyval(p, x);
plot(x, y, 'LineWidth', 1.5)
xlabel("Uf0 [V]")
ylabel("mT")
xlim([0, 270])
ylim([0, 1.5])
title('mT = f(Uf0)')