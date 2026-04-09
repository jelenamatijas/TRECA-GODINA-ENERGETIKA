%==========================================================================
%                           CRTANJE GRAFIKA                               %
%==========================================================================

close all

% ZAVISNOST AKTIVNE SNAGE U FUNKCIJI UGLA OPTERECENJA
figure(1)
plot(delta(:,2)*180/pi,pe,'Color','b','LineWidth',1.5)
hold on
plot(delta(:,2)*180/pi,ones(size(delta(:,2)))*pm,'Color','r','LineWidth',1.5)
set(gca,'FontSize',12,'FontName','Times New Roman')
title('Zavisnost snage od ugla opterecenja')
xlabel('Ugao opterecenja ({\it\delta} ) [deg]')
ylabel('Snaga u [r.j.]')
legend('{\itp}_e({\it\delta} )','{\itp}_m','Location','NorthWest')
grid on

% PROMJENA UGLA OPTERECENJA U VREMENU
figure(2)
plot(t,delta(:,2)*180/pi,'LineWidth',1.5)
set(gca,'FontSize',12,'FontName','Times New Roman')
title('Zavisnost ugla opterecenja od vremena')
xlabel('Vrijeme ({\itt}) [s]')
ylabel('Ugao snage ( {\it\delta} ) [deg]')
grid on

% PROMJENA UGAONE BRZINE U VREMENU
figure(3)
plot(t,omega(:,2),'LineWidth',1.5)
set(gca,'FontSize',12,'FontName','Times New Roman')
title('Zavisnost \Delta{\it\omega} = {\itf} ({\itt} )')
ylabel('Ugaona brzina (  {\it\omega} ) [rad/s]')
grid on
xlabel('Vrijeme [s]')
% legend('\Delta\omega(\delta)')

% PROMJENA UGAONE BRZINE U FUNKCIJI UGLA OPTERECENJA
figure(4)
plot(omega(:,2),delta(:,2)*180/pi,'LineWidth',1.5)
set(gca,'FontSize',12,'FontName','Times New Roman')
title('Zavisnost \Delta{\it\omega} = {\itf} ({\it\delta} )')
ylabel('Ugao opterecenja ( {\it\delta} ) [deg]')
grid on
xlabel('Ugaona brzina ({\it\omega} ) [rad/s]')
% legend('\Delta\omega(\delta)')