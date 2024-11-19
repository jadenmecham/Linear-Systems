% Problem 5.1
A=[1 1 0; 0 1 0; 0 1 1];
B=[0;1;0];
C=[1 3 1];
D=[0];

contMat = [B A*B A^2*B];


% Controllable Subsys
Cext = [0 1 0; 1 1 0; 0 1 1];
Tc = inv(Cext);

Atilde = Tc*A*inv(Tc);
Btilde = Tc*B;
Ctilde = C*inv(Tc);

% Observable Subsys
obsMat = [C; C*A; C*A^2]
Oext = [1 3 1; 1 5 1; 0 0 1]
Tc2 = Oext;
Atilde2 = Tc2*A*inv(Tc2);
Btilde2 = Tc2*B;
Ctilde2 = C*inv(Tc2);

% Both
Oboth = [Ctilde; Ctilde*Atilde; Ctilde*Atilde^2];
Obothext = [3 5 1; 5 7 1; 0 0 1];
Tcboth = Obothext;
Atildeboth = Tcboth*Atilde*inv(Tcboth)
Btildeboth = Tcboth*Btilde
Ctildeboth = Ctilde*inv(Tcboth)
%% 
% Problem 5.2
syms a b c q1 q2
A = [0 1; -2 -3];
AT = [0 -2; 1 -3];
P = [a b; b c];
Q= [q1 0; 0 q2];

eq = AT*P + P*A



