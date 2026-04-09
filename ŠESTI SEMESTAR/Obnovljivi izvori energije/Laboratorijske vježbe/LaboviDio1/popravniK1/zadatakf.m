Latitude=42.7082;
Longitude=18.3503;
CollectorAzimuthAngle=0;
TiltAngle1=50;
TiltAngle2=15;
LocalTimeMeridian=15;
bDaylightSavings=1;
nDay=DayNum(22,8);
Tamb=19;
W1=0;
W2=0;

for h=0:0.1:23.9
    [SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, h,...
        Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);
    if SunAltitude>0
        [DirectRadiation1, DiffuseRadiation1, ExtraterrestrialRadiation] = ...
            SolarRadiation(nDay, SunAltitude, ...
            TiltAngle1, SolarAzimuthAngle, CollectorAzimuthAngle);
        [DirectRadiation2, DiffuseRadiation2, ExtraterrestrialRadiation] = ...
            SolarRadiation(nDay, SunAltitude, ...
            TiltAngle2, SolarAzimuthAngle, CollectorAzimuthAngle);
        Gc1=DirectRadiation1+DiffuseRadiation1;
        Gc2=DirectRadiation2+DiffuseRadiation2;
        Tc1=Tamb+26*Gc1/800;
        Tc2=Tamb+26*Gc2/800;
        Tc=[Tc1 Tc1 Tc2];
        Gc=[Gc1 Gc1 Gc2];
        sim('ModelPopravni.slx')
        W1=W1+max(U.*I)*0.1;
        Tc=[Tc1 Tc2 Tc2];
        Gc=[Gc1 Gc2 Gc2];
        sim('ModelPopravni.slx')
        W2=W2+max(U.*I)*0.1;
    end
end
W=W1+W2