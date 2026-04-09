% zeljeni polovi su z1 = 0.6823 + j*0.2885 i z2 = 0.6823 - j*0.2885

z = tf('z');

fd = (0.0014*24.72*(z + 3.1484)*(z + 0.2239))/((z-1)*(z - 0.2225)^2);

zpk(fd)

rlocus(fd)
