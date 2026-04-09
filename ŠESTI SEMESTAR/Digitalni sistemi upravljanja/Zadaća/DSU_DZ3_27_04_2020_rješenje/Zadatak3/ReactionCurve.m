function [model, controller, time_constant, time_delay, gain] =
ReactionCurve(t, y, u)
% REACTIONCURVE Process Reaction Curve approach to approximate high-order
% systems by a first-order-plus-timedelay model using step
% response data. This model can be used to design a PID
% controller
% [model,P,PI,PID]=ReactionCurve(t,y,u)
%Inputs:
% t: time vector of step repose
% y: output vector of step repose
% u: step input vector or scalar (input change)
%Outputs:
% model: first-order-plus-timedelay model structue, which includes
% gain (steady-state gain), time_constant (first-order time
% constant) and tiem_deltay.
% controllers: structure of transfer functions of P-only, PI and PID
% controllers.
%Example:
% G = tf([2 1],[1 4 6 4 1]); % (2s+1)/(s+1)^4
% [y,t]=step(G); % step response of G
% [model,controller]=ReactionCurve(t,y);
% T=feedback(G*controller.PID,1);
% step(T)
%
% By Yi Cao at Cranfield University, on 1st October 2007
%
% Edited by Velibor Djalic, on 22nd April 2020
%
if nargin < 3
du = 1;
t0 = 0;
u = 1;
elseif isscalar(u)
du = u;
t0 = 0;
else
du = u(end) - u(1);
t0 = find(diff(u));
end
gain = (y(end) - y(1))/du;
dy = diff(y);
dt = diff(t);
[mdy, I] = max(abs(dy)./dt);
time_constant = abs(y(end) - y(1))/mdy;
time_delay = t(I)-abs(y(I) - y(1))/mdy-t0;
subplot(211)
plot(t, y, [t0+time_delay t0+time_delay+time_constant], [y(1) y(end)],...
[t(1) t(end)], [y(1) y(1)], '--', [t(1) t(end)], [y(end) y(end)], '--');
title('output')
subplot(212)
if isscalar(u)
plot([t0 t(end)], [u u])
else
    plot(t, u)
end
title('input')
model.gain = gain;
model.time_constant = time_constant;
model.time_delay = time_delay;
time_delay = max(time_delay, time_constant/10);
controller.P = time_constant/time_delay/gain;
controller.PI = 0.9*time_constant/time_delay/gain*tf([3.3*time_delay 1],
[3.3*time_delay 0]);
controller.PID = 1.2*time_constant/time_delay/gain*tf([time_delay^2
2*time_delay 1], [2*time_delay 0]);
% Copyright (c) 2009, Yi Cao
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
%
% * Redistributions of source code must retain the above copyright
% notice, this list of conditions and the following disclaimer.
% * Redistributions in binary form must reproduce the above copyright
% notice, this list of conditions and the following disclaimer in
% the documentation and/or other materials provided with the
% distribution

% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.