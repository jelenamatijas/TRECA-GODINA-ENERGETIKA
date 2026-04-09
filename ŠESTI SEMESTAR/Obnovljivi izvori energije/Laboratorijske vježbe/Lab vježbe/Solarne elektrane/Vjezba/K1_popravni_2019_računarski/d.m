clc 
clear all

nDay = DateNum(22, 8);
Longitude = 18.3503;
Latitude = 42.7082;
LocalTimeMeridian = 15;
bDaylightSavings = 1;
TiltAngle = 0;
ClockTime = 11.8; 
CollectorAzimuthAngle = 0;

[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay,...
    ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

[DirectRadiation, DiffuseRadiation, ExtraterrestrialRadiation] = SolarRadiation(nDay,...
    SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle)
