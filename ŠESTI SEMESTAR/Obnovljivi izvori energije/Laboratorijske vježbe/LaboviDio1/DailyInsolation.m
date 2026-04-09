Longitude=17.1833;
Latitude=44.7667;
LocalTimeMeridian=15;
nDayMax=DayNum(31, 10);
nDayMin=DayNum(28, 3);
CollectorAzimuthAngle=0;
TiltAngle=60;

Results=zeros(2, 365);
k=1;

for n=1:1:365
    Results(1,k)=n;
    if n>nDayMin && n<nDayMax
        bDaylightSavings=1;
    else
        bDaylightSavings=0;
    end
    for h=1:1:24
       [SunAltitude, SolarAzimuthAngle] = SunPosition(n, h, ...
           Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);
       [DirectRadiation, DiffuseRadiation, ExtraterrestrialRadiation] = ...
           SolarRadiation(n, SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle);
       Results(2,k)=Results(2,k)+DirectRadiation+DiffuseRadiation;
    end
    k=k+1;
end