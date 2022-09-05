function K = z5260252(Ai,Bi)
% Given variables from excel sheet:
P_OS = 6.16186473055022; % %
T_s = 1.12849502180248; % secs
Fs_1 = 2.13464519729045;
Fs_2 = 2.33213995220903;
 
% Damping Ratio:
DR = (-log(P_OS / 100)) / (sqrt(pi^2 + (log(P_OS / 100))^2));
% Natural Frequency:
NF = (-log(0.02 * sqrt(1 - (DR^2)))) / (T_s * DR);
% Damped Natural Frequency:
DNF = NF * sqrt(1 - (DR^2));

% Determine dominant poles (p1 and p2) using settling time and percent 
% overshoot
p1 = -(DR * NF) + DNF*1j;
p2 = -(DR * NF) - DNF*1j;
% Determine non-dominant poles (p3 and p4) using the real part of p1 and 
% given constant separation parameters:
p3 = real(p1) * Fs_1;
p4 = real(p1) * Fs_2;
% p5 is given:
p5 = -0.1;
p = [p1, p2, p3, p4, p5];

% Derive control gains:
K = place(Ai, Bi, p);
return