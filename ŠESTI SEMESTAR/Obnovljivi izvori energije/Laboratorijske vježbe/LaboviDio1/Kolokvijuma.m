n=DayNum(25,4);
Latitude=42.7082;
Longitude=18.3503;
LocalTimeMeridian=15;
bDaylightSavings=1;
ClockTime=0:0.01:23.99;

[SunAltitude, SolarAzimuthAngle] = SunPosition(n, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

subplot(211)
plot(ClockTime, SunAltitude, 'LineWidth', 2)
grid on
xlabel('Time [h]')
ylabel('Elevation angle [degrees]')
ylim([-30, 70])

subplot(212)
plot(ClockTime, SolarAzimuthAngle, 'LineWidth', 2)
grid on
xlabel('Time [h]')
ylabel('Azimuth angle [degrees]')

