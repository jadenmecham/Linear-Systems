clear all
close all
clc

A = [-0.02 -1.4 9.8;
     -0.01 -0.4 0;
      0    1.0  0];
B = [9.8; 6.3; 0];

% Find open-loop poles
open_loop_poles = eig(A);
disp('Open-loop poles:');
disp(open_loop_poles);

desired_poles = [-2, -1 + 1j, -1 - 1j];

% Compute state feedback gain K
K = place(A, B, desired_poles);
disp('State-feedback gain K:');
disp(K);

% Closed-loop system matrix
A_cl = A - B * K
C = eye(3);  % Full-state observation
D = zeros(3, 1);

% Time vector
t = 0:0.01:10;

% Step input
u = ones(size(t));

% Open-loop response
[open_loop_response, ~, x_open] = lsim(ss(A, B, C, D), u, t);

% Closed-loop response
[closed_loop_response, ~, x_closed] = lsim(ss(A - B * K, B, C, D), u, t);

% Plot responses
figure;
subplot(3,1,1); hold on; grid on;
plot(t, x_open(:,1), 'r', t, x_closed(:,1), 'b');
title('State x1 (Horizontal Velocity)');
legend('Open-loop', 'Closed-loop');

subplot(3,1,2); hold on; grid on;
plot(t, x_open(:,2), 'r', t, x_closed(:,2), 'b');
title('State x2 (Pitch Rate)');
legend('Open-loop', 'Closed-loop');

subplot(3,1,3); hold on; grid on;
plot(t, x_open(:,3), 'r', t, x_closed(:,3), 'b');
title('State x3 (Pitch Angle)');
legend('Open-loop', 'Closed-loop');
