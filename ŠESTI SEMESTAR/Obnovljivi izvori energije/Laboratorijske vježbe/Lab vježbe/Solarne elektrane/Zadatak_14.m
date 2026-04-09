clear, clc

Day = 19;
Month = 3;
ClockTime = 0:0.01:12;
Longitude = 17.1833;
Latitude = 44.7667;
LocalTimeMeridian = 15;
bDaylightSavings = 0;

Results = zeros(365, 2);

%[ nDay ] = DateNum( Day, Month );

for nDay=1:1:365

[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, ClockTime, Longitude,...
    Latitude, LocalTimeMeridian, bDaylightSavings);

Sunrise = sum(SunAltitude < 0) * 0.01;

Results(nDay, 1) = nDay;
Results(nDay, 2) = Sunrise;

end


plot(Results(:, 1),Results(:, 2), 'LineWidth', 2)
grid on
xlabel('nDay')
ylabel('Sunrise')
