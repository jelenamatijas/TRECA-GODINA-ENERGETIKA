Irradiance=1000;
Boja=[0 0 1; 0 1 0; 1 0 0; 1 0 1; 1 1 0];

for i=0:1:4
    Tc=-25+i*25;
    sim('zadatak2a.slx')
    figure(1)
    plot(U, I, 'LineWidth', 2, 'Color', Boja(i+1, :))
    xlim([0, 30])
    ylim([0, 3.5])
    grid on
    hold on
    figure(2)
    plot(U, U.*I, 'LineWidth', 2, 'Color', Boja(i+1, :))
    xlim([0, 30])
    ylim([0, 80])
    grid on
    hold on
end