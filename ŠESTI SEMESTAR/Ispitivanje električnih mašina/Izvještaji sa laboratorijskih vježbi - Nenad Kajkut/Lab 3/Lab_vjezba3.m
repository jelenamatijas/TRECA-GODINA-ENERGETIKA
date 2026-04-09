clear all
close all
clc

%Rezultati ogleda praznog hoda
Ip01 = [0 0.1 0.2 0.3 0.4 0.5 0.59]; %Vektor pobudne struje za uzlaznu krivu PH
E01 = [4.73 131.47 205.25 244.03 267.68 283.76 295.11]; %Vektor EMS za uzlaznu krivu PH
Ip02 = [0.59 0.5 0.4 0.3 0.2 0.098 0]; %Vektor pobudne struje za silaznu krivu PH
E02 = [295.11 285.65 271.46 250.65 215.66 150.39 20.81]; %Vektor EMS za silaznu krivu PH
Pgub = [64.43 77.14 92.85 103.43 114.77 124.64 131.14]; %Vektor gubitaka PH GJS
E011 = E01.^2;

%Crtanje karakteristike praznog hoda
figure(1)
plot(Ip01, E01, 'LineWidth', 1.5)
grid on
hold on
plot(Ip02, E02, 'LineWidth', 1.5)
xlim([0, 0.6])
ylim([0, 300])
xlabel("Ip0 [A]")
ylabel("E0 [V]")
title('Karakteristika PH')

%Crtanje karakteristike gubitaka PH GJS (Pfv + PFe = f(E0))
figure(2)
plot(E01, Pgub, 'r*')
grid on
hold on
x=0:0.01:300;
y=64+0.00074*x.^2;
plot(x, y, 'LineWidth', 1.5, 'Color', 'b')
xlim([0, 300])
ylim([60, 140])
xlabel("E0 [V]")
ylabel("Pfv + PFe [W]")
title('Karakteristika gubitaka PH GJS')

%Crtanje karakteristike gubitaka PH GJS (Pfv + PFe = f(E0^2))
figure(3)
plot(E011, Pgub, 'r*')
grid on
hold on
x=0:1:90000;
y=64+0.00074*x;
plot(x, y, 'LineWidth', 1.5)
xlabel("E0^2 [V^2]")
ylabel("Pfv + PFe [W]")
title('Karakteristika gubitaka PH GJS')