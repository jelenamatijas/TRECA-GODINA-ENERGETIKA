clear, clc

Day = 6;
Month = 5;
ClockTime = 1:0.01:23;
Longitude = 17.1833;
Latitude = 44.7667;
LocalTimeMeridian = 15;
bDaylightSavings = 1;

[ nDay ] = DateNum( Day, Month );

[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

subplot(2, 1, 1)
plot(ClockTime, SunAltitude, 'LineWidth', 2)
grid on
xlabel('ClockTime')
ylabel('SunAltitude')

hold on

subplot(2, 1, 2)
plot(ClockTime, SolarAzimuthAngle, 'LineWidth', 2)
grid on
xlabel('ClockTime')
ylabel('SolarAzimuthAngle')

