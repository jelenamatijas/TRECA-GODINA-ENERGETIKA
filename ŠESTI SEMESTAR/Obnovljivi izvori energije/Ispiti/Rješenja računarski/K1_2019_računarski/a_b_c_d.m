clc
clear all

nDay = DateNum(25, 4);
Longitude = 18.3503;
Latitude = 42.7082;
LocalTimeMeridian = 15;
bDaylightSavings = 1;
ClockTime = 0:0.01:24;


[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);


subplot(2, 1, 1)
plot(ClockTime, SunAltitude, 'LineWidth', 1.5)
grid on
xlabel('ClockTime')
ylabel('SunAltitude')

hold on

subplot(2, 1, 2)
plot(ClockTime, SolarAzimuthAngle, 'LineWidth', 1.5)
grid on
xlabel('ClockTime')
ylabel('SolarAzimuthAngle')    

