function [Kp, Ti, Td] = ZieglerNichols_PID(gain, time_constant, time_delay)
Kp=(1.2*time_constant)/(gain*time_delay);
Ti=2*time_delay;
Td=0.5*time_delay;
end
