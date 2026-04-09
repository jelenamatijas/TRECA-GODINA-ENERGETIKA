Day=6;
Month=3;
ClockTime=0:0.01:23;
Longitude=17.1910;
Latitude=44.7722;
LocalTimeMeridian=15;
bDaylightSavings=0;

Results = zeros(2, 365)

nDayM = DayNum(28, 3)
nDayO = DayNum(31, 10)

for nDay=1:1:365
    bDaylightSavings =0;
    [SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

A= SunAltitude(1,1:1200) < 0;
SunriseTime = sum(A)*0.01;
Results(2, nDay) = SunriseTime;

    if nDay > nDayM && nDay < nDayO
        bDaylightSavings =1;
    else
        bDaylightSvings=0;
    end

[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

A= SunAltitude(1,1:1200) < 0;
SunriseTime = sum(A)*0.01;

Results(1, nDay)= nDay;
Results(3, nDay) = SunriseTime;

end

plot(Results(1, :), Results(2, :))
hold on
plot(Results(1, :), Results(3, :), 'r')
grid
xlabel('Day')
ylabel('Sunrise [h]')