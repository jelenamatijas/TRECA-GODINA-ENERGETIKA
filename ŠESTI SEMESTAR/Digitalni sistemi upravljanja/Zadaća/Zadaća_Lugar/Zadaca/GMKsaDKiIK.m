% zeljeni polovi su z1 = 0.6823 + j*0.2885 i z2 = 0.6823 - j*0.2885

z = tf('z');

s = tf('s');

f = 10/(s*(s+2)*(s+5));

Gob = c2d(f,0.1,'ZOH');

Gc = (24.72*(z-0.6065)*(z-0.8187)*(z-0.9855))/((z-0.99)*(z-0.2225)^2);

fd = Gob*Gc;

zpk(fd)

rlocus(fd)