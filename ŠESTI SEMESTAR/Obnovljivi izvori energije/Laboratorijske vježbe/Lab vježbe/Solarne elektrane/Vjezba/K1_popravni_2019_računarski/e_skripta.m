clc, clear

nDay = DateNum(22, 8);
Longitude = 18.3503;
Latitude = 42.7082;
LocalTimeMeridian = 15;
bDaylightSavings = 1;
TiltAngle1 = 50;
TiltAngle2 =15; 
CollectorAzimuthAngle = 0;
Tamb = 19;
NOCT = 46;

G1 = zeros(231, 3);
G2 = zeros(231, 3);
P1 = zeros(231, 1);
P2 = zeros(231, 1);
k = 1;

for ClockTime = 1:0.1:24
    
   [SunAltitude, SolarAzimuthAngle] = SunPosition(nDay,...
    ClockTime, Longitude, Latitude, LocalTimeMeridian, bDaylightSavings); 
    
    [DirectRadiation1, DiffuseRadiation1, ~] = SolarRadiation(nDay,...
        SunAltitude, TiltAngle1, SolarAzimuthAngle, CollectorAzimuthAngle);
    
    [DirectRadiation2, DiffuseRadiation2, ~] = SolarRadiation(nDay,...
        SunAltitude, TiltAngle2, SolarAzimuthAngle, CollectorAzimuthAngle);
    
    G1(k, 1) = DirectRadiation1;
    G1(k, 2) = DiffuseRadiation1;
    G1(k, 3) = DirectRadiation1 + DiffuseRadiation1;
    G2(k, 1) = DirectRadiation2;
    G2(k, 2) = DiffuseRadiation2;
    G2(k, 3) = DirectRadiation2 + DiffuseRadiation2;
    
    Gc1 = G1(k, 3);
    Gc2 = G2(k, 3);
    
    Tpv1 = Tamb + ((NOCT - 20)/800)*Gc1;
    Tpv2 = Tamb + ((NOCT - 20)/800)*Gc2;
    
    sim('e_f')
    
    P1(k, 1) = max(Upv .* Ipv);
    
    Gc2 = G1(k, 3);
    Gc1 = G2(k, 3);
    
    Tpv1 = Tamb + ((NOCT - 20)/800)*Gc1;
    Tpv2 = Tamb + ((NOCT - 20)/800)*Gc2;
    
    sim('e_f')
    
    P2(k, 1) = max(Upv .* Ipv);
    
    
    k = k + 1;
end

W = 0.1 * (sum(P1(:, 1)) + sum(P2(:, 1)))

ClockTime = 1:0.1:24;
plot(ClockTime, P1)
grid on
hold on
plot(ClockTime, P2)
