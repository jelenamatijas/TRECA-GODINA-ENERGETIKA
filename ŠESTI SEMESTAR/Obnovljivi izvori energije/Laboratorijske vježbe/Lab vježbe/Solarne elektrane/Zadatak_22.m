clear, clc

Longitude = 17.1833;
Latitude = 44.7667;
LocalTimeMeridian = 15; 
bDaylightSavings = 0;
TiltAngle = 60;
CollectorAzimuthAngle = 35;
%Kada poredimo sa torijskim maksimumom
% TiltAngle = 44.7667;
% CollectorAzimuthAngle = 0;

Results = zeros(365*24, 2);
k=1;

for nDay = 1:1:365
    for ClockTime = 1:1:24

[SunAltitude, SolarAzimuthAngle] = SunPosition(nDay,...
    ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings);

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