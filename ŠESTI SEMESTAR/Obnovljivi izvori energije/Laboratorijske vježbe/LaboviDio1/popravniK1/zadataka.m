nDay=DayNum(22, 8);
Latitude=42.7082;
Longitude=18.3503;
LocalTimeMeridian=15;
bDaylightSavings=1;
ClockTime=0:0.01:23.9;

[SunAltitude, SolarAzimuthAngle]=SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

subplot(211)
plot(ClockTime, SunAltitude, 'LineWidth', 2)
grid on
xlim([0, 24])
ylim([-20, 65])
xlabel('Time [h]')
ylabel('Elevation Angle [degrees]')

subplot(212)
plot(ClockTime, SolarAzimuthAngle, 'LineWidth', 2)
grid on
xlim([0, 24])
xlabel('Time[h]')
ylabel('Azimuth Angle [degrees]')
