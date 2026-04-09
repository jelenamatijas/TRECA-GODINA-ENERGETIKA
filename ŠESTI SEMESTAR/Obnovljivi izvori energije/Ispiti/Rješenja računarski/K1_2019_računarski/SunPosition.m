function [SunAltitude, SolarAzimuthAngle] = SunPosition(nDay, ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings)
%==========================================================================
% Description:
%   Function to estimate position of the sun for a given day in a year
%   on an arbitrary loacation on the earth designated by its longitude and
%   latitude.
%
% Originator: 
%   Faculty of Electrical Engineering, Banja Luka
%   Department of Electrical Power Engineering
%   
% History:
%   22.07.2014. Version 1 
%   08.12.2014. Version 2
%
% Input:
%   nDay [integer]
%   ClockTime [hours]
%   Longitude [degrees]
%   Latitude [degrees]
%   LocalTimeMeridian [degrees]
%   bDaylightSavings [logical]
%
% Output:
%   SunAltitude [degrees]
%   SolarAzimuthAngle [degrees]
%==========================================================================

SolarDeclination = 23.45*sin(2*pi*(nDay-81)/365)*pi/180;
B = 2*pi*(nDay-81)/364;
E = (9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B))/60; % E[hours]
SolarTime = ClockTime + E - (LocalTimeMeridian-Longitude)/15 - bDaylightSavings;

HourAngle = pi*(12-SolarTime)/12;

SunAltitude = (180/pi)*asin(cos(Latitude*pi/180).*cos(SolarDeclination).*cos(HourAngle)+sin(Latitude*pi/180).*sin(SolarDeclination));
SolarAzimuthSine = cos(SolarDeclination).*sin(HourAngle)./cos(SunAltitude*pi/180);

bCondition = cos(HourAngle)>=(tan(SolarDeclination)/tan(Latitude*pi/180));
SolarAzimuthAngle = bCondition.*(180*asin(SolarAzimuthSine)/pi)+...
        (1-bCondition).*(180-180*asin(SolarAzimuthSine)/pi);
    SolarAzimuthAngle = mod(SolarAzimuthAngle+180,360)-180;
end

%==========================================================================
