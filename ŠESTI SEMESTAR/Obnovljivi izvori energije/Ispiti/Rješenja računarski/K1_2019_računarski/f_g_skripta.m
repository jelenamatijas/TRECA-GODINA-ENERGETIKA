clear, clc

Tc = 14;
nDay = DateNum(25, 4);
Longitude = 18.3503;
Latitude = 42.7082;
LocalTimeMeridian = 15;
bDaylightSavings = 1;
TiltAngle = 15;
NOCT = 46;


Ge = zeros(231, 3);
Gz = zeros(231, 3);
P = zeros(231, 1);
k=1;


for ClockTime = 1:0.1:24

[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay,...
    ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

CollectorAzimuthAngle1 = 90;
CollectorAzimuthAngle2 = -90;

[DirectRadiation1, DiffuseRadiation1, ExtraterrestrialRadiation1] = SolarRadiation(...
    nDay, SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle1);

[DirectRadiation2, DiffuseRadiation2, ExtraterrestrialRadiation2] = SolarRadiation(...
    nDay, SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle2);

Ge(k, 1) = DirectRadiation1;
Ge(k, 2) = DiffuseRadiation1;
Ge(k, 3) = DirectRadiation1 + DiffuseRadiation1;
Gz(k, 1) = DirectRadiation2;
Gz(k, 2) = DiffuseRadiation2;
Gz(k, 3) = DirectRadiation2 + DiffuseRadiation2;


Gc1 = Ge(k, 3)
Gc2 = Ge(k, 3)

T1 = Tc + ((NOCT-20)/800)*Gc1;
T2 = Tc + ((NOCT-20)/800)*Gc2;


sim('f_g')

P1(k, 1)=max(Upv.*Ipv);

Gc1 = Gz(k, 3)
Gc2 = Gz(k, 3)

T1 = Tc + ((NOCT-20)/800)*Gc1;
T2 = Tc + ((NOCT-20)/800)*Gc2;

sim('f_g')

P2(k, 1)=max(Upv.*Ipv);
k = k+1;
end


W = (sum(P1(:,1)) + sum(P2(:,1)))*0.1


ClockTime = 1:0.1:24;

figure(1)
plot(ClockTime, P1, 'LineWidth', 1.5)
grid on
xlabel('Upv [V]')
ylabel('Ipv [A]')

figure(2)
plot(ClockTime, P2, 'LineWidth', 1.5)
grid on
xlabel('Upv [V]')
ylabel('P [W]')