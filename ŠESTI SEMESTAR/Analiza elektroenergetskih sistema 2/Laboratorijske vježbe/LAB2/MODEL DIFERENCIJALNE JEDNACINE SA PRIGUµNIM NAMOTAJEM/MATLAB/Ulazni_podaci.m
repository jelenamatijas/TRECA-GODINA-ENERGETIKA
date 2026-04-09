clear all;
close all;
clc;
disp('*******************************************************************')
disp('*       ELEKTROTEHNICKI FAKULTET UNIVERZITETA U BANJOJ LUCI       *')
disp('*                  DRUGA LABORATORIJSKA VJEZBA                    *')
disp('*              ANALIZA ELEKTROENERGETSKIH SISTEMA 2               *')
disp('*******************************************************************')

%==========================================================================
%                     ULAZNI PODACI ZA SIMULACIJU                         %
%==========================================================================

% PODACI O SIMULACIJI:

Tsim = 30;          % Vrijeme trajanja simulacije u [s]

% PODACI O SISTEMU

Ub   = 110;         % Bazni napon u [kV]
f    = 50;          % Frekvencija sistema u [Hz]
wnom = 2*pi*f;      % Ugaona ucestanost u [rad]
Ti   = 6;           % Vremenska konstanta inercije agregata u [s]
H    = Ti/2;
E    = 106.1;       % Vrijednost modula tranzijentne EMS generatora u [kV]
Umbs = 110;         % Vrijednost modula napona MBS u [kV]
                    % MBS - Mreza beskonacne snage
                    
%==========================================================================
%                                 PRORACUNI                               %
%==========================================================================

% PRORACUN PARAMETARA U SISTEM RELATIVNIH JEDINICA

e    = E / Ub;      % Vrijednost modula tranzijentne EMS generatora u [r.j.]
disp(['Vrijednost modula tranzijentne EMS generatora iznosi  : ',...
    num2str(e,'%2.4f') ' [r.j.]']);
umbs = Umbs / Ub;   % Vrijednost modula napona MBS u [r.j.]
disp(['Vrijednost modula napona mreze beskonacne snage iznosi: ',...
    num2str(umbs,' %2.4f') ' [r.j.]']);

% PODACI O SNAZI KOJU GENERATOR ISPORUCUJE/ODAJE U SISTEM

pm     = 0.7500;    % Mehanicka snaga turbine u [r.j.]
pemax  = 1.6220;    % Maksimalna elektricna snaga koju generator ...
                    % isporucuje prije kvara u [r.j.]
pekmax = 0.8110;    % Maksimalna elektricna snaga koju generator ...
                    % isporucuje za vrijeme kvara u [r.j.]
peimax = 1.6220;    % Maksimalna elektricna snaga koju generator ...
                    % isporucuje poslije iskljucenja kvara u [r.j.]

% PODACI O KVARU

tf  = 0.000;        % Trenutak u kom nastaje kvara u [s]
tcl = 0.790;        % Trenutak u kom se otklanja kvar [s]

% PODACI O PRIGUSNOM NAMOTAJU

PD = 0.01;         % Modelovanje efekta prigusnog namotaja

% PRORACUN VRIJEDNOSTI POCETNOG I GRANICNOG UGLA GENERATORA

deltainit = asin(pm / pemax);       % Pocetna vrijednost ugla generatora u [rad]
disp(['Pocetna vrijednost ugla generatora iznosi: ',...
    num2str(deltainit*180/pi,' %2.2f') ' [deg]']);
deltakr  = pi - asin(pm / peimax);  % Granicna vrijednost ugla generatora u [rad]
disp(['Granicna vrijednost ugla generatora:       ',...
    num2str(deltakr*180/pi,' %2.2f') ' [deg]']);
                            
%==========================================================================
%                           POKRETANJE SIMULACIJE                         %
%==========================================================================
sim('ModelDiferencijalneJednacine.mdl');	% Pokretanje simulacije

%==========================================================================
%    POKRETANJE SKRIPTE ZA GRAFICKU ILUSTRACIJU VELICINA OD INTERESA      %
%==========================================================================
Crtaj;                                      % Pokretanje skripte Crtaj.m