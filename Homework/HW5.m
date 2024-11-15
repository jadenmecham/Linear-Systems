% Problem 5.1
A=[-1 4; 4 -1];
B=[1; 1];
C=[1 1];
D=[0];

contMat = [B A*B];
obsMat = [C; C*A];

Cext = [1 0; 3 1];
Tc = inv(Cext);

Atilde = Tc*A*inv(Tc);
Btilde = Tc*B;
Ctilde = C*inv(Tc);

Oext = [1 1; 0 1];
Tc2 = inv(Oext);
Atilde2 = Tc2*A*inv(Tc2)
Btilde2 = Tc2*B
Ctilde2 = C*inv(Tc2)
%% 
% Problem 5.2
syms a b c d q1 q2
A = [0 1; -2 -3];
AT = [0 -2; 1 -3];
P = [a b; c d];
Q= [q1 0; 0 q2];

eq = AT*P + P*A
lyap(A,Q)


