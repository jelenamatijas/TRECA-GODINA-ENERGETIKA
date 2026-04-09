clear, clc 

%Tc = 25; %Zadatak pod a)
Gc = 1000; %Zadatak pod b)
Boja = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 1 0 1];

for i = 1:1:5
    
    %Gc = i*200; %Zadatak pod a)
    Tc = i*25-50; %Zadatak pod b)
    sim('Zadatak_32')
    
    figure(1)
    plot(Upv, Ipv, 'Color', Boja(i,:), 'LineWidth', 2)
    hold on
    
    figure(2)
    plot(Upv, Upv.*Ipv, 'Color', Boja(i,:), 'LineWidth', 2)
    hold on
    
end

figure(1)
% xlim([0 23]) %Zadatak pod a)
% ylim([0 3.2]) 
xlim([0 30]) %Zadatak pod b)
ylim([0 3.5])
xlabel('Upv [V]')
ylabel('Ipv [A]')
%legend('200 W/m^2', '400 W/m^2', '600 W/m^2', '800 W/m^2', '1000 W/m^2') %Zadatak pod a)
legend('-25 W/m^2', '0 W/m^2', '25 W/m^2', '50 W/m^2', '75 W/m^2') %Zadatak pod b)

figure(2)
%xlim([0 23]) %Zadatak pod a)
%ylim([0 60]) 
xlim([0 30]) %Zadatak pod b)
ylim([0 70])
xlabel('Upv [V]')
ylabel('Ppv [W]')
%legend('200 W/m^2', '400 W/m^2', '600 W/m^2', '800 W/m^2', '1000 W/m^2') %Zadatak pod a)
legend('-25 W/m^2', '0 W/m^2', '25 W/m^2', '50 W/m^2', '75 W/m^2') %Zadatak pod b)

