nDay=DayNum(20, 3);
TiltAngle=0:0.01:90;
[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, 11.99, 17.1833, 44.7667, 15, 1)
CollectorAzimuthAngle=SolarAzimuthAngle;

[B, D, E]=SolarRadiation(nDay, 44.42, TiltAngle, 0, 0);

plot(TiltAngle, B+D, 'LineWidth', 2)
xlabel('TiltAngle[degrees]')
ylabel('Direct+Diffuse Radiation')
grid on

