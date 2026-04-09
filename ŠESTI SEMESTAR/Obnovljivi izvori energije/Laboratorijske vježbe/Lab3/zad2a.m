Tc=25;
Boja=[0 0 1; 0 1 0; 1 0 0; 1 0 1; 1 1 0];

for i=1:1:5
   Irradiance=200*i;
   sim('zadatak2a.slx')
   figure(1)
   plot(U, I, 'Color', Boja(i, :), 'LineWidth', 2)
   xlim([0, 23])
   ylim([0, 3.5])
   grid on
   hold on
   figure(2)
   plot(U, U.*I, 'Color', Boja(i, :), 'LineWidth', 2)
   xlim([0, 23])
   ylim([0, 50])
   grid on
   hold on
end