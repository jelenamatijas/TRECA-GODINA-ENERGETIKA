Latitude=42.7082;
Longitude=18.3503;
CollectorAzimuthAngle=0;
TiltAngle1=50;
TiltAngle2=15;
LocalTimeMeridian=15;
bDaylightSavings=1;
nDay=DayNum(22,8);
ClockTime=0:0.01:23.99;

[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

subplot(211)
plot(ClockTime, SunAltitude, 'LineWidth', 2)
grid on
xlim([0, 24])
ylim([-20, 65])

subplot(212)
plot(ClockTime, SolarAzimuthAngle, 'LineWidth', 2)
grid on
xlim([0, 24])