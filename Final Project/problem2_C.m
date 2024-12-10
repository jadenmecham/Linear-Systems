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

% Desired closed-loop poles
desired_poles = [-130, -2, -2.5 + 2j, -2.5 - 2j];
% Compute feedback gain K
K = place(A, B, desired_poles);
disp('gain k:');
disp(K);

% Desired observer poles
observer_poles = [-25, -30, -35, -1000];
% Compute observer gain L
L = place(A', C', observer_poles)';
disp('Observer Gain Matrix L:');
disp(L);

% Simulation Time
t = 0:0.01:10;  % Simulate for 10 seconds

% Initial Conditions
x0 = [pi/180; 4*pi/180; 0; 0];
xhat0 = [0; 6*pi/180; 0; 0];

% Input (Assume zero input for simplicity here)
u = zeros(size(t));

% Open-Loop System
sys_open = ss(A, B, C, D);
[y_open, ~, x_open] = lsim(sys_open, u, t, x0);

% Full-State Feedback System
A_fb = A - B * K;
sys_fb = ss(A_fb, B, C, D);
[y_fb, ~, x_fb] = lsim(sys_fb, u, t, x0);

% Observer-Based Feedback
A_obs = [A - B * K, B * K; zeros(size(A)), A - L * C];
B_obs = [B; zeros(size(B))];
C_obs = [C, zeros(size(C))];
sys_obs = ss(A_obs, B_obs, C_obs, D);

% Initial conditions for combined system (observer and plant)
x0_obs = [x0; xhat0];
[y_obs, ~, x_obs] = lsim(sys_obs, u, t, x0_obs);

% Extracting Observer Error
e_obs = x_obs(:, 1:size(A, 1)) - x_obs(:, size(A, 1)+1:end);

% Plot Results
figure;

% Open-loop response
subplot(3, 1, 1);
plot(t, y_open);
title('Open-Loop Response');
xlabel('Time (s)');
ylabel('Outputs');

% Full-State Feedback Response
subplot(3, 1, 2);
plot(t, y_fb);
title('Full-State Feedback Response');
xlabel('Time (s)');
ylabel('Outputs');

% Observer-Based Feedback Response
subplot(3, 1, 3);
plot(t, y_obs(:, 1:2));  % Only plot plant outputs (first two states)
title('Observer-Based Feedback Response');
xlabel('Time (s)');
ylabel('Outputs');

% Plot Observer Error
figure;
plot(t, e_obs);
title('Observer Error');
xlabel('Time (s)');
ylabel('Error (e(t))');
legend('e_1', 'e_2', 'e_3', 'e_4');