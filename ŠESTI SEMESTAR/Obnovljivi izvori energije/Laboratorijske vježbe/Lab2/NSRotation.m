Longitude=17.1833;
Latitude=44.7667;
LocalTimeMeridian=15;
TiltAngle=Latitude;
nDayMax=DayNum(31, 10);
nDayMin=DayNum(28, 3);

Results=zeros(365*24, 4);

k=1;
for n=1:1:365
    if n>nDayMin && n<nDayMax
        bDaylightSavings=1;
    else
        bDaylightSavings=0;
    end
    for h=1:1:24
        [SunAltitude, SolarAzimuthAngle] = SunPosition(n, h, Longitude, Latitude, ...
            LocalTimeMeridian, bDaylightSavings);
        
        ThetaZ=90-SunAltitude;
        CosThetaPrim=cos(ThetaZ*pi/180)*cos(Latitude*pi/180)+sin(ThetaZ*pi/180)*...
            sin(Latitude*pi/180)*cos(ThetaZ*pi/180);
        
        Uslov1=atan(sin(ThetaZ*pi/180)*sin(SolarAzimuthAngle*pi/180)/...
            (CosThetaPrim * sin(Latitude*pi/180)));
        
        if Uslov1>=0
            C1=0;
        else
            C1=1;
        end
        
        if SolarAzimuthAngle<0
            C2=-1;
        else
            C2=1;
        end
        
        CollectorAzimuthAngle=atan(sin(ThetaZ*pi/180)*sin(SolarAzimuthAngle*pi/180)/...
            (CosThetaPrim*sin(Latitude*pi/180)))*180/pi + 180*C1*C2;
        TiltAngle=atan(tan(Latitude*pi/180)/cos(abs(CollectorAzimuthAngle*pi/180)))...
            * 180/pi;
        [DirectRadiation, DiffuseRadiation, ExtraterrestrialRadiation] = ...
            SolarRadiation(n, SunAltitude, TiltAngle, SolarAzimuthAngle,...
            CollectorAzimuthAngle);
        Results(k,1)=SunAltitude;
        Results(k,2)=SolarAzimuthAngle;
        Results(k,3)=DirectRadiation;
        Results(k,4)=DiffuseRadiation;
        k=k+1;
    end
end
AnnualDirectRadiation=sum(Results(:,3))
AnnualDiffuseRadiation=sum(Results(:,4))