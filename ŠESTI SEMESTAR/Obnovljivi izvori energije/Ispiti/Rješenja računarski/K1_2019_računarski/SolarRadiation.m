function [DirectRadiation, DiffuseRadiation, ExtraterrestrialRadiation] = SolarRadiation(nDay, SunAltitude, TiltAngle, SolarAzimuthAngle, CollectorAzimuthAngle)
%==========================================================================
% Description:
%   Function to estimate the direct and diffuse solar radiation for a given 
%   day in a year also knowing the position of the sun and orientation of 
%   the collector.
%
% Originator: 
%   Faculty of Electrical Engineering, Banja Luka
%   Department of Electrical Power Engineering
%   
% History:
%   22.07.2014. Version 1 
%   15.12.2014. Version 2
%
% Input:
%   nDay [integer]
%   SunAltitude [degrees]
%   TiltAngle [degrees]
%   SolarAzimuthAngle [degrees]
%   CollectorAzimuthAngle [degrees]
%
% Output:
%   DirectRadiation [W/m2]
%   DiffuseRadiation [W/m2]
%   ExtraterrestrialRadiation [W/m2]
%==========================================================================

if SunAltitude <= 0
    DirectRadiation = 0;
    DiffuseRadiation = 0;
    ExtraterrestrialRadiation =0;
    return;
end

SolarConstant = 1366; % W/m2
G0 = SolarConstant*(1+0.034*cos(2*pi*nDay/365));
A = 1160+75*sin(2*pi*(nDay-275)/365);
k = 0.174+0.035*sin(2*pi*(nDay-100)/365);
m = 1/sin(SunAltitude*pi/180);
C = 0.095+0.04*sin(2*pi*(nDay-100)/365);
Gb = A*exp(-k*m);

DirectRadiation = Gb*(cos(SunAltitude*pi/180)*cos(SolarAzimuthAngle*pi/180-CollectorAzimuthAngle*pi/180)*sin(TiltAngle*pi/180)+sin(SunAltitude*pi/180)*cos(TiltAngle*pi/180));
DiffuseRadiation = C*Gb*(1+cos(TiltAngle*pi/180))/2;
ExtraterrestrialRadiation = G0*(cos(SunAltitude*pi/180)*cos(SolarAzimuthAngle*pi/180-CollectorAzimuthAngle*pi/180)*sin(TiltAngle*pi/180)+sin(SunAltitude*pi/180)*cos(TiltAngle*pi/180));

dCondition = DirectRadiation > 0;
DirectRadiation = DirectRadiation.*dCondition;

eCondition = ExtraterrestrialRadiation > 0;
ExtraterrestrialRadiation = ExtraterrestrialRadiation.*eCondition;
end

%==========================================================================
