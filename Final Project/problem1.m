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
%%
% problem 1e part 1

% controllability and observability for part A

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

contMat = [B A*B A^2*B] % controllability matrix
obsMat = [C; C*A; C*A^2] % observability matrix

disp("rank of controllability matrix:")
disp(rank(contMat));
disp("rank of observability matrix:")
disp(rank(obsMat));
%%
% problem 1e part 2

% controllability and observability for part D

% state space matrices:
A = [0    1    0;
     0    0    1;
     -6   -3  -1];
 
B = [0;
     0;
     2];
 
C = [1  0  0];

D = [0];

contMat = [B A*B A^2*B] % controllability matrix
obsMat = [C; C*A; C*A^2] % observability matrix

disp("rank of controllability matrix:")
disp(rank(contMat));
disp("rank of observability matrix:")
disp(rank(obsMat));
