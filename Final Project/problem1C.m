% problem 1b
syms s
% known properties:
L = 1;  % inductance 
R = 2;  % resistance 
J = 1;  % moment of inertia
b = 1;  % viscous damping  
K = 2;  % torque constant

% state space matrices:
A = [0    1    0;
     0   -b/J  K/J;
     0   -K/L -R/L];
 
B = [0    0;
     0   -1/J;
     1/L  0];
 
C = [1 0 0; 
     0 0 1];

D = [0 0; 
     0 0];

SI = [s 0 0;
      0 s 0;
      0 0 s];

G = C*inv(SI-A)*B+D
%%
% problem 1c
% known properties:
L = 1;  % inductance 
R = 2;  % resistance 
J = 1;  % moment of inertia
b = 1;  % viscous damping  
K = 2;  % torque constant

% state space matrices:
A = [0    1    0;
     0   -b/J  K/J;
     0   -K/L -R/L];
 
B = [0    0;
     0   -1/J;
     1/L  0];
 
C = [1 0 0; 
     0 0 1];

D = [0 0; 
     0 0];

% make the state space model
sys_ss = ss(A, B, C, D);

% find transfer function
sys_tf = tf(sys_ss);

% show transfer function
disp('transfer function G(s):');
sys_tf
