function K = z5260252(Ai,Bi)
% System Paramters
M = 3.22; % (kg) - Cart system mass
l = 0.1778; % (m) - Distance from pivot point to pendulum's centre of mass
m = 0.127; % (kg) - Pendulum mass
u_m = 80; % (%) - Motor efficiency
K_t = 0.36; % (Nm/A) - Motor torque constant
r_mp = 1.11*10^-2; % (m) - Motor pinion radius
g = 9.81; % (m/s^2) - Gravity

% State Space Model
Ai = [0 0 1 0 0; 0 0 0 1 0; 0 (g*m)/M 0 0 0; 0 ((M+m)*g)/(l*m) 0 0 0; 1 0 0 0 0];
Bi = [0; 0; (u_m*K_t)/(M*r_mp); (u_m*K_t)/(M*l*r_mp); 0];

% Time Domain Requirements:
P_OS = 6.16186473055022; % (%OS)
T_s = 1.12849502180248; % (secs)
Fs_1 = 2.13464519729045; % constant separation parameter
Fs_2 = 2.33213995220903; % constant separation parameter

% Equations:
DR = (-log(P_OS / 100)) / (sqrt(pi^2 + (log(P_OS / 100))^2)); % Damping ratio
NF = (-log(0.02 * sqrt(1 - (DR^2)))) / (T_s * DR); % Natural frequency
DNF = NF * sqrt(1 - (DR^2)); % Damped natural frequency

% Dominant poles:
p1 = -(DR * NF) + DNF*1j;
p2 = -(DR * NF) - DNF*1j;
% Non-dominant poles:
p3 = real(p1) * Fs_1;
p4 = real(p1) * Fs_2;
% p5 is given:
p5 = -0.1;
p = [p1, p2, p3, p4, p5];

% Derive control gains:
K = place(Ai, Bi, p);
return