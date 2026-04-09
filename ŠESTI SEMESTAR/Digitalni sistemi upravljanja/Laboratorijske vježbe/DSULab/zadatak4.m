%Zadatak 4
close all
clear all
clc

s = tf('s');
z = tf('z', 0.1);

W = 10/(s*(s+2)*(s+5));
Gd = (((z-0.6065)*(z-0.8187))/((z-0.225)*(z-0.225)));
Gi = ((z-0.9855)/(z-0.99));

Wd = c2d(W,0.1);
figure(1)
rlocus(Wd)

figure(2)
rlocus(Wd*Gd)

figure(3)
rlocus(Wd*Gi*Gd)
