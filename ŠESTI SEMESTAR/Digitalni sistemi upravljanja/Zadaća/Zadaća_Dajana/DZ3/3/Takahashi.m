function [Kp, Ki, Kd] = Takahashi(gain, time_constant, time_delay)
T=0.01;
Ki=(0.6*time_constant*T)/(gain*(time_delay+0.5*T)^2);
Kd=(0.5*time_constant)/(gain*T);
Kp=(1.2*time_constant)/(gain*(time_delay+T))-(0.5*Ki)/gain;
end

