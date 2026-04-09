% Zadatak 3

clear all
clc

T = 0.01;                      %Perioda odabiranja 

% Parametri objekta upravljanja
G = tf([1.68], [0.231 1.3 1]); % (1.68)/(0.231s^2+1.3s+1)
[y, t] = step(G);              % odskočni odziv od G
[model, controller, T0, tau, K0] = ReactionCurve(t, y);
H = feedback(G*controller.PID, 1);
step(H)

% K0 = 1.6772;
% T0 = 1.7287-0.1144;
% tau = 0.1144;

% Ziegler-Nichols metoda
% [Kp, Ti, Td] = ZieglerNichols_PID(K0, T0, tau);
% sim('PID')

% Takahashi metoda
[Kp, Ki, Kd, Ti, Td] = Takahashi_PID(K0, T0, tau, T);
sim('PID')
