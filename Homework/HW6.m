clear all
close all
clc
% the system:
A = [0 1 0; 0 0 1; -18 -15 -2];
B = [0; 0; 1];
C = [1 0 0];
D = 0;

% poles
domPoles = [-1.33 + 1.488i, -1.33 - 1.488i];
thirdPole = -13.33;
desired_poles = [domPoles, thirdPole];

% find gain K
K = place(A, B, desired_poles);

% make the closed system
A_cl = A - B * K;

%Open-loop step response
sys_open = ss(A, B, C, D);
figure;
step(sys_open);
title('Open-Loop Step Response');

% Closed-loop step response
sys_closed = ss(A_cl, B, C, D);
figure;
step(sys_closed);
title('Closed-Loop Step Response');

% Open-loop initial condition response
x0 = [1; 0; 0];
figure;
initial(sys_open, x0);
title('Open-Loop Initial Condition Response');

% Closed-loop initial condition response
figure;
initial(sys_closed, x0);
title('Closed-Loop Initial Condition Response');

