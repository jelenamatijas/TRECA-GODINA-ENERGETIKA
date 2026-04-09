% Parametri za analizu digitalnih regulatora

clear all
clc

% Paramatri objekta upravljanja

T = 0.01;    % Perioda odabiranja, [s]
K0 = 2;   % Pojacanje sistema
T0 = 1.1;   % Vremenska konstanta sistema, [s]
tau = 0.733;  % Transporntno kasnjenje objekta upravljanja


% Ziegler-Nicholas metoda
% Kp = (1.2*T0)/(K0*tau); % Pojacanje proporcionalnog dejstva
% Ti = 2*tau;         % Integraciona vremenska konstanta
% Td = 0.5*tau;       % Derivaciona vremenska konstanta

%Takahashi metoda
  Ki = 0.6*T0*T/K0/(tau + 0.5*T)^2;      % Pojacanje integracionog dejstva
  Kp = 1.2*T0/K0/(tau + T) - 0.5*Ki/K0;  % Pojacanje proporcionalnog dejstva
  Kd = 0.5*T0/K0/T;                      % Pojacanje derivacionog dejstva
  Ti = Kp*T/Ki;                          % Integraciona vremenska konstanta
  Td = T*Kd/Kp;                          % Derivaciona vremenska konstanta

