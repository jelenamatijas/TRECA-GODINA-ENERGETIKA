clear all
close all
clc

%Rezultati ogleda praznog hoda
Ip01 = [0.05 0.07 0.09 0.11 0.15 0.195 0.26 0.28 0.315 0.35 0.395 0.47 0.56]; %Vektor pobudne struje za uzlaznu krivu PH
E01 = [61 90 120 150 200 250 300 320 340 360 380 400 420]; %Vektor EMS za uzlaznu krivu PH
Ip02 = [0.56 0.45 0.375 0.33 0.295 0.265 0.24 0.185 0.14 0.105 0.085 0.065 0.05]; %Vektor pobudne struje za silaznu krivu PH
E02 = [420 400 380 360 340 320 300 250 200 144 120 89 64]; %Vektor EMS za silaznu krivu PH

%Rezultati ogleda kratkog spoja
Ipk = [0.68 0.88 1.12 1.35 1.6 1.85]; %Vektor pobudne struje za KS
Iak = [5 7 9 11 13 15]; %Vektor struje faze A KS
Ibk = [5.5 7 9.25 11 13 14]; %Vektor struje faze B KS
Ick = [5.5 7 9.25 11.25 13.25 15]; %Vektor struje faze C KS

%Crtanje karakteristike praznog hoda
figure(1)
subplot(1, 2, 1)
plot(Ip01, E01, 'LineWidth', 1.5)
grid on
hold on
plot(Ip02, E02, 'LineWidth', 1.5)
x = 0:0.005:2;
y = 1400*x;
plot(x, y, 'LineWidth', 1.5, 'Color', 'g')
xlim([0, 0.6])
ylim([0, 600])
xlabel("Ip0 [A]")
ylabel("E0 [V]")
title('Karakteristika PH')

%Crtanje karakteristike kratkog spoja
subplot(1, 2, 2)
x = 0:0.005:2;
y = 8.13*x;
plot(x, y, 'LineWidth', 1.5)
grid on
hold on
plot(Ipk, Iak, 'r*')
xlim([0, 2])
ylim([0, 16])
xlabel("Ipk [A]")
ylabel("Ifk [A]")
title('Karakteristika KS Ifk = f(Ipk)')