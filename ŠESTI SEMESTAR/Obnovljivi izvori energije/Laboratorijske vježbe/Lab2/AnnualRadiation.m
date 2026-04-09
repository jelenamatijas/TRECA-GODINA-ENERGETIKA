Longitude=17.1833;
Latitude=44.7667;
LocalTimeMeridian=15;
nDayMin=DayNum(28,3);
nDayMax=DayNum(31, 10);

results=zeros(365*24, 2);
k=1;

for nDay=1:1:365
    if nDay<nDayMin || nDay>nDayMax
        bDaylightSavings=0;
    else
        bDaylightSavings=1;
    end
    for h=0:1:23
        [SunAltitude, SolarAzimuthAngle]=SunPosition(nDay, h, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);
        CollectorAzimuthAngle=SolarAzimuthAngle;
        TiltAngle=90-SunAltitude;
        if SunAltitude>0
            [B, D, E]=SolarRadiation(nDay, SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle);
            results(k,1)=B;
            results(k,2)=D;
        end
        k=k+1;
    end
end

AnnualDirectRadiation=sum(results(:, 1));
AnnualDiffuseRadiation=sum(results(:, 2));
AnnualRad=AnnualDirectRadiation+AnnualDiffuseRadiation
