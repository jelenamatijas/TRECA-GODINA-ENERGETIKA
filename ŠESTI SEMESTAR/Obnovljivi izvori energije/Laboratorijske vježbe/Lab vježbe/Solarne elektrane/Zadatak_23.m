clear, clc

Longitude = 17.1833;
Latitude = 44.7667;
LocalTimeMeridian = 15; 
bDaylightSavings = 0;

Results = zeros(365*24, 2);
k=1;

for nDay = 1:1:365
    for ClockTime = 1:1:24

[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay,...
    ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

CollectorAzimuthAngle = SolarAzimuthAngle; %Ako imamo samo ovaj red onda je praćenje putanje sunca po jednoj osi
TiltAngle = 90 - SunAltitude; %Ako imamo i ovaj red onda je praćenje putanje sunca po dvije ose

[DirectRadiation, DiffuseRadiation, ExtraterrestrialRadiation] = SolarRadiation(...
    nDay, SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle);

Results(k, 1) = DirectRadiation;
Results(k, 2) = DiffuseRadiation;
k = k+1;

    end
end

AnnualDirectRadiation = sum(Results(:,1))
AnnualDiffuseRadiation = sum(Results(:,2))
AnnualRadiation = AnnualDirectRadiation + AnnualDiffuseRadiation