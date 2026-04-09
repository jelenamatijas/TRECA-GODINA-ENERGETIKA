clear all
close all
tMax = 0.1;
t = 0 : 0.0001 : tMax;
f = 50;
fs = 90;
ts = 0 : 1/fs : tMax;
fcontinous = cos(2 * pi * f * t);
fsampled = cos(2 * pi * f * ts);

figure
hold on
set(gca, 'fontsize', 14, 'fontweight', 'bold');
plot(t, fcontinous, 'b', 'linewidth', 2);
plot(ts, fsampled, 'ko', 'linewidth', 2);

if(fs < 2 * f)
    flag = 1;
    m = 0;
    while(flag)
        fAliasing = abs(f - m * fs);
        if(fAliasing <= fs/2)
            flag = 0;
        else
            m = m + 1;
        end
    end
    plot(t, cos(2 * pi * fAliasing * t), 'r', 'linewidth', 2);
    title(['Aliasing frekvencija ' num2str(fAliasing) ' Hz ']);
else
    title('Ne postoji aliasing frekvencija');
end

ylim([-1.5 1.5])
grid on
xlabel('Vrijeme [s]')