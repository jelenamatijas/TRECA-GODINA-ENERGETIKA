clear all
clc

Temp_amb = 20.6;
Udc = [11.6 11.5 11.7 11.9 11.9 12 12 11.9 11.8 11.8]; %Vektor izmjerenih napona
Idc = [0.21 0.190 0.185 0.18 0.18 0.185 0.185 0.185 0.175 0.170]; %Vektor izmjerenih struja
RdcT = Udc./Idc; %Vektor otpornosti namotaja primara na novoj temperaturi u zavisnosti od pojedinačnih mjerenja
Rdc = 56.3; %Otpornost namotaja primara na ambijentalnoj temperaturi
TD = [20.6 23.4 27 27.5 28 30.4 37 37.9 37.2 39.9]; %Temperatura donjeg sloja namotaja
TG = [20.6 36.6 43.7 49 52.3 54.5 56.4 57.7 59 61.3]; %Temperatura gornjeg sloja namotaja
TJ = [20.6 24.5 29.2 33.5 35.7 34.1 37.5 38.5 37.8 43.4]; %Temperatura jezgra
T=zeros(1, 10);

for k=1:1:10
    if (k==1)
        T(1, k)=(RdcT(1, k)/Rdc)*(235+Temp_amb)-235+4.82;
    else
     T(1, k)=(RdcT(1, k)/Rdc)*(235+Temp_amb)-235;
    end
end

figure(1)
% subplot(1, 2, 1)
t = [0 5 10 15 20 25 30 35 40 45];
plot(t, T, 'r*')
grid on
xlim([0, 50])
ylim([0, 90])
hold on
xlabel("t [min]")
ylabel("ϑ [℃]")
t=0:0.01:50;
T=20.6+61*(1-exp(-0.07133*t));
plot(t, T, 'LineWidth', 2)
t=zeros(1, 501);
T=zeros(1, 501);
for i=1:1:5001
    T(1, i)=80.17;
end

t=0:0.01:50;
plot(t, T, 'LineWidth', 2)
t=0:0.01:50;
y=20.6+4.25*t;
plot(t, y, 'LineWidth', 2)
title('ϑ = f (t)')
xlabel('t [min]')
ylabel('ϑ [ºC]')

% Ovde sam pokusavao na razne načine da dobijem interpolacije
%za izmjerene temperature, međutim nisam uspio dobiti ono što se traži i očekuje 
% subplot(1, 2, 2)
% t = [0 5 10 15 20 25 30 35 40 45];
% plot(t, TD, 'r*')
% hold on
% x=0:0.01:50;
% y = interp1(t, TD, x, 'spline');
% plot(x, y, 'LineWidth', 1.5)
% plot(t, TG, 'b*')
% x=0:0.01:50;
% y = interp1(t, TG, x);
% plot(x, y, 'LineWidth', 1.5)
% plot(t, TJ, 'g*')
% x=0:0.01:50;
% y = interp1(t, TJ, x);
% plot(x, y, 'LineWidth', 1.5)
% grid on
% xlim([0, 50])
% ylim([0, 90])
% hold on
% xlabel("t [min]")
% ylabel("ϑ [℃]")