% question 2b
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
C = [0 1 0 0];
D = 0;

% Desired closed-loop poles
desired_poles = [-130, -2, -2.5 + 2j, -2.5 - 2j];
% Compute feedback gain K
K = place(A, B, desired_poles);
disp('gain k:');
disp(K);

% open loop
sys_open = ss(A, B, C, D);

% closed loop
A_cl = A - B * K;
sys_closed = ss(A_cl, B, C, D);


t = linspace(0, 5, 500);  
u = zeros(size(t));
x0 = [pi/180; 4*pi/180; 0; 0];  

% Simulate open-loop response
[alpha_open, t_open, x_open] = lsim(sys_open, u, t, x0);

% Simulate closed-loop response
[alpha_closed, t_closed, x_closed] = lsim(sys_closed, u, t, x0);

% Plot results
figure;
plot(t_open, alpha_open, 'r-', 'LineWidth', 1.5); hold on;
plot(t_closed, alpha_closed, 'b-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Pendulum Angle \alpha (rad)');
legend('Open-Loop', 'Closed-Loop');
title('Pendulum Angle Response (\alpha)');
grid on;

