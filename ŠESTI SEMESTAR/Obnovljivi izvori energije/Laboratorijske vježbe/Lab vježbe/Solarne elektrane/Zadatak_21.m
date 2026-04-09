clear, clc 

nDay = DateNum(11, 5);
SunAltitude = 63.0156;
%TiltAngle = 0; %Kad određujemo zračenje na horizontalno postavljen kolektor
%TiltAngle = 90; %Kad određujemo zračenje na vertikalno postavljen kolektor
TiltAngle = 0:0.1:90; %Kad određujemo optimalni ugao kolektora
SolarAzimuthAngle = 0;
CollectorAzimuthAngle = 0;

[DirectRadiation, DiffuseRadiation, ExtraterrestrialRadiation] = SolarRadiation(...
    nDay, SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle)

%Crtanje krive pomoću koje ćemo odrediti optimalni ugao kolektora
plot(TiltAngle, DirectRadiation)
hold on
plot(TiltAngle, DiffuseRadiation, 'r')
hold on
plot(TiltAngle, DirectRadiation+DiffuseRadiation, 'g')
grid on
xlabel('TiltAngle')
ylabel('Radiation')
legend('DirectRadiation', 'DiffuseRadiation', 'DirectRadiation+DiffuseRadiation')