day=25;
month=4;
nDay=DayNum(day, month);
Longitude=17.1833;
Latitude=44.7667;
LocalTimeMeridian=15;
bDaylightSavings=0;
ClockTime=0:0.001:23.99;

DayMax=DayNum(31,10);
if nDay>DayMin && nDay<DayMax
   bDaylightSavings=1;
end

[SunAltitude, SolarAzimuthAngle]=SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

subplot(211)
plot(ClockTime, SunAltitude, 'LineWidth', 2)
xlabel('Time[h]')
xlim([0 24])
ylabel('Elevation Angle[degrees]')
ylim([-50, 80])
grid on

subplot(212)
plot(ClockTime, SolarAzimuthAngle, 'LineWidth', 2)
xlabel('Time[h]')
xlim([0 24])
ylabel('Solar Azimuth Angle[degrees]')
ylim([-200, 200])
grid on
