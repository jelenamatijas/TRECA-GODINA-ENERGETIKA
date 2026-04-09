ClockTime=0:0.01:23.99;
Longitude=17.1910;
Latitude=44.7722;
LocalTimeMeridian=15;
bDaylightSavings=0;

DayMax=DayNum(31, 10);
DayMin=DayNum(28, 3);

Results=zeros(3, 365);

for nDay=1:1:365
    bDaylightSavings=0;
    [SunAltitude, SolarAimuthAngle]=SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);
    
    Results(1, nDay)=nDay;
    SunAltitude=SunAltitude(1, 1200:2400)<0;
    Results(2, nDay)=24-0.01*sum(SunAltitude);
    
    if nDay>DayMin && nDay<DayMax
        bDaylightSavings=1;
    else
        bDaylightSavings =0;
    end
    [SunAltitude, SolarAimuthAngle]=SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);
     SunAltitude=SunAltitude(1, 1200:2400)<0;
    Results(3, nDay)=24-0.01*sum(SunAltitude);
end

plot(Results(1, :), Results(2, :));
hold on
plot(Results(1, :), Results(3, :), 'r-');
xlabel('Dani')
ylabel('Sunset Time [h]')
grid on
