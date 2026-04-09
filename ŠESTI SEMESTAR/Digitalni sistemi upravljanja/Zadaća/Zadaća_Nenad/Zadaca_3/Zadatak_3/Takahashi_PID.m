function [Kp, Ki, Kd, Ti, Td] = Takahashi_PID(gain, time_constant, time_delay, sampling_period)
Ki = (0.6*time_constant*sampling_period)/(gain*(time_delay+0.5*sampling_period)^2);
Kd = (0.5*time_constant)/(gain*sampling_period);
Kp = (1.2*time_constant)/(gain*(time_delay+sampling_period))-(0.5*Ki)/gain;
Ti = (Kp*sampling_period)/Ki;
Td = (Kd*sampling_period)/Kp;
end

