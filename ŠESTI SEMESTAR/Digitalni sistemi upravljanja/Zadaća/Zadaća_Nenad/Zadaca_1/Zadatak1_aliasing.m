clear all
close all
clc
tMax = 0.3; % Maksimalno vrijeme trajanja signala
t = 0 : 0.0001 : tMax; % Definisanje trenutaka u kojim se izracunava kontinualni signal
f = 50; % Frekvencija kontinualnog signala
fs = 80; % Definisanje frekvencije odabiranja
ts = 0 : 1/fs : tMax; % Definisanje diskretnih trenutaka na osnovu frekvencije odabiranja
fcontinous = sin(2 * pi * f * t); % Kontinualna funkcija
fsampled = sin(2 * pi * f * ts); % Diskretizovana funkcija
% Crtanje funkcija
figure
hold on
set(gca, 'fontsize', 14, 'fontweight', 'bold');
plot(t, fcontinous, 'b', 'linewidth', 2);
plot(ts, fsampled, 'ko', 'linewidth', 2);
% Provjera da li je frekvencija odabiranja adekvatno odabrana i da li postoji aliasing
if (fs < 2 * f)
flag = 1;
m = 0
while (flag)
fAliasing = abs(f - m * fs);
if (fAliasing <= fs/2)
flag = 0;
else
m = m + 1;
end
end
plot(t, sin(2 * pi * fAliasing * t), 'r', 'linewidth', 2);
title(['Aliasing frekvencija ' num2str(fAliasing) ' Hz']);
else
title('Ne postoji aliasing frekvencija');
end
ylim([-1.5 1.5])
grid on
2
xlabel('Vrijeme [s]')