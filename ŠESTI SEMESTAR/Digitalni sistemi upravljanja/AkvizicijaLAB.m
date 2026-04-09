dev = HudaqDevice('MF634');
t = [25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100];
u = [0.223 0.262 0.306 0.356 0.393 0.441 0.477 0.517 0.573 0.615 0.668 0.721 0.775 0.837 0.893 0.976];
T = table(t, u);
u1 = AIRead(dev, 1);
u2 = AIRead(dev, 2);

for i= 1:1000
    u1 = AIRead(dev, 1);
    k = find(T.u<u1);
    if(length(k)>0)
        AOWrite(dev, 2, length(k)*0.625);
    end
end
    

