%Ulani podaci
nDay=DayNum(25,4);
Latitude=42.7082;
Longitude=18.3503;
LocalTimeMeridian=15;
bDaylightSavings=1;
CollectorAzimuthAngle1=90;
CollectorAzimuthAngle2=-90;
TiltAngle=15;
Tamb=14;
W1=0;
W2=0;

for h=0.1:0.1:24
    [SunAltitude, SolarAzimuthAngle] = ...
        SunPosition(nDay, h, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);
    if SunAltitude>0
        [DirectRadiation1, DiffuseRadiation1, ExtraterrestrialRadiation] = ...
            SolarRadiation(nDay, SunAltitude, TiltAngle, ...
            SolarAzimuthAngle, CollectorAzimuthAngle1);
        [DirectRadiation2, DiffuseRadiation2, ExtraterrestrialRadiation] = ...
            SolarRadiation(nDay, SunAltitude, TiltAngle, ...
            SolarAzimuthAngle, CollectorAzimuthAngle2);
        Gc1=DirectRadiation1+DiffuseRadiation1;
        Gc2=DirectRadiation2+DiffuseRadiation2;
        Tc1=Tamb+26*Gc1/800;
        Tc2=Tamb+26*Gc2/800;
        Tc=[Tc1 Tc1 Tc2 Tc2];
        Gc=[Gc1 Gc1 Gc2 Gc2];
        sim('mppt.slx')
        W1=W1+max(U.*I)*0.1;
        Tc=[Tc1 Tc1 Tc2 Tc2];
        Gc=[Gc1 Gc1 Gc2 Gc2];
        sim('mppt.slx')
        W2=W2+max(U.*I)*0.1;
    end
end
W=W1+W2