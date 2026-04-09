% Parametri za analizu digitalnih regulatora

clear all
clc

% Paramatri objekta upravljanja

T = 1;    % Perioda odabiranja, [s]
K0 = -0.015;   % Pojacanje sistema
T0 = 12.55;   % Vremenska konstanta sistema, [s]
tau = 2.3;  % Transporntno kasnjenje objekta upravljanja
N = 2;
Ts = 2;

% Ziegler-Nicholas metoda
% Kp = (1.2*T0)/(K0*tau); % Pojacanje proporcionalnog dejstva
% Ti = 2*tau;             % Integraciona vremenska konstanta
% Td = 0.5*tau;           % Derivaciona vremenska konstanta

%Takahashi metoda
 % Ki = 0.6*T0*T/K0/(tau + 0.5*T)^2;      % Pojacanje integracionog dejstva
 % Kp = 1.2*T0/K0/(tau + T) - 0.5*Ki/K0;  % Pojacanje proporcionalnog dejstva
 % Kd = 0.5*T0/K0/T;                      % Pojacanje derivacionog dejstva
 % Ti = Kp*T/Ki;                          % Integraciona vremenska konstanta
 % Td = T*Kd/Kp;                          % Derivaciona vremenska konstanta

% Dahlinov algoritam PI regulator
 Kp = (1-exp(-T/Ts))/[K0*(exp(T/T0) - 1)*(1 + N*(1 - exp(-T/Ts)))];
 K = 0.0829;  % T/Ti
% M = 1.8018; % Td/T
