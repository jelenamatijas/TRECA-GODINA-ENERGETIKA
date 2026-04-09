Gc=1000;

figure(1)

for i=1:1:5
    Tc=-50+i*25;
    sim('Model.slx')
    plot(U, I, 'LineWidth', 2)
    hold on
end

xlim([0, 30])
ylim([0, 3.3])
grid on
legend('-25', '0', '25', '50', '75')