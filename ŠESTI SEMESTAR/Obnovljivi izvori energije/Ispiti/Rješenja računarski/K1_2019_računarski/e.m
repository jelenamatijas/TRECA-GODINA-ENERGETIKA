clc
clear all

nDay = DateNum(25, 4);
Longitude = 18.3503;
Latitude = 42.7082;
LocalTimeMeridian = 15;
bDaylightSavings = 1;
TiltAngle = 15;
ClockTime = 12.74;
CollectorAzimuthAngle = 90;


[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings)
[DirectRadiation, DiffuseRadiation, ExtraterrestrialRadiation] = SolarRadiation(nDay, SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle)

