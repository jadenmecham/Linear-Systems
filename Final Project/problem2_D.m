clear all 
close all
clc

r = 0.222;
Jb = 0.005;
lp = 0.167;
mp = 0.126;
g = 9.81;
Ra = 2.6;
Kt = 7.68 * 10^(-3);
Kb = 7.68 * 10^(-3);
Kg = 70;

A1 = (-mp*r*g)/Jb;
A2 = (-Kt*Kg^2*Kb)/(Ra*Jb);
A3 = ((Jb+(mp*r^2))*g)/(lp*Jb);
A4 = (r*Kt*Kg^2*Kb)/(Ra*lp*Jb);

B1 = (Kt*Kg)/(Ra*Jb);
B2 = (-r*Kt*Kg)/(Ra*lp*Jb);

A = [0 0 1 0;
     0 0 0 1;
     0 A1 A2 0;
     0 A3 A4 0];
B = [0;0;B1;B2];
C = [1 0 0 0;
     0 1 0 0];
D = 0;

% Partition A, B, C matrices for reduced-order observer
A_m = A(1:2, 1:2);  % Dynamics of measurable states
A_u = A(3:4, 3:4);  % Dynamics of unmeasurable states
A_um = A(3:4, 1:2); % Coupling between measurable and unmeasurable
B_m = B(1:2);
B_u = B(3:4);
C_m = C(:, 1:2);     % Output for measurable states
C_u = C(:, 3:4);