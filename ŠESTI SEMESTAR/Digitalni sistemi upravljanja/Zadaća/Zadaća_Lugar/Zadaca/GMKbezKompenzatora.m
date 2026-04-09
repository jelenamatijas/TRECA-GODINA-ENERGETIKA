% zeljeni polovi su z1 = 0.6823 + j*0.2885 i z2 = 0.6823 - j*0.2885

s = tf('s');

f = 10/(s*(s+2)*(s+5));

fd = c2d(f,0.1,'ZOH');

zpk(f)

rlocus(f)
