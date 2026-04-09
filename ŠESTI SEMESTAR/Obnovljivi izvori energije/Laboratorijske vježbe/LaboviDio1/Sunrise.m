ClockTime=0:0.01:23;
Longitude=17.1910;
Latitude=44.7722;
LocalTimeMeridian=15;
Results=zeros(3, 365);
nDayMax=DayNum(31, 10);
nDayMin=DayNum(28, 3);
h=0:0.01:23.99;

for nDay=1:1:365
    bDaylightSavings=0;
    Results(1, nDay)=nDay;
        [SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, h, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);
        A=SunAltitude(1, 1:1200)<0;
        sr=sum(A)*0.01;
        Results(2, nDay)=sr;
    if nDay>nDayMin && nDay<nDayMax
        bDaylightSavings=1;
    end
        [SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, h, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);
        A=SunAltitude(1, 1:1200) < 0;
        sr=sum(A)*0.01;
        Results(3, nDay)=sr;
end

plot(Results(1, :), Results(2, :))
hold on
plot(Results(1, :), Results(3, :))
