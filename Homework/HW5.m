% Problem 5.1
A=[-1 4; 4 -1];
B=[1;1];
C=[1 1];
D=[0];

contMat = [B A*B];


% Controllable Subsys
Cext = [1 0; 1 1];
Tc = inv(Cext);

Atilde = Tc*A*inv(Tc);
Btilde = Tc*B;
Ctilde = C*inv(Tc);

% Observable Subsys
obsMat = [C; C*A];
Oext = [1 1; 0 1];
Tc2 = Oext;
Atilde2 = Tc2*A*inv(Tc2);
Btilde2 = Tc2*B;
Ctilde2 = C*inv(Tc2);

% Both
Oboth = [Ctilde; Ctilde*Atilde];
Obothext = [2 1; 0 1];
Tcboth = Obothext;
Atildeboth = Tcboth*Atilde*inv(Tcboth)
Btildeboth = Tcboth*Btilde
Ctildeboth = Ctilde*inv(Tcboth)
%% 
% Problem 5.2
P = [5 1; 1 1];
Pt=transpose(P)
eigvals = eig(P)
%%
% Problem 5.3
syms s
A=[-1 10; 0 1];
B=[-2; 0];
C=[-2 3];
D=[-2];
S = [s 0; 0 s];

g=C*inv((S-A))*B+D
%%
% test
% Define the state-space matrices
A = [-1 10; 0 1];   % State matrix
B = [-2; 0];         % Input matrix
C = [-2 3];          % Output matrix
D = -2;              % Feedthrough matrix

% Create the state-space system
sys = ss(A, B, C, D);

% Convert the state-space system to a transfer function
[num, den] = ss2tf(A, B, C, D);

% Display the transfer function
fprintf('Numerator coefficients: ');
disp(num);

fprintf('Denominator coefficients: ');
disp(den);

tf(num, den)

