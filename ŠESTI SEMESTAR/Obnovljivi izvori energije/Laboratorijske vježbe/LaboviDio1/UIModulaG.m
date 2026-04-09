Tc=25;

figure(1)

for i=1:1:5
    Gc=i*200;
    sim('Model.slx')
    plot(U, I, 'LineWidth', 2)
    hold on
end

grid on
xlim([0, 25])
ylim([0, 3.2])
legend('200', '400', '600', '800', '1000')
