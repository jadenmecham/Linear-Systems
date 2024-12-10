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

% Desired observer poles
observer_poles = [-25, -30, -35, -1000];

% Compute observer gain L
L = place(A', C', observer_poles)';

disp('Observer Gain Matrix L:');
disp(L);