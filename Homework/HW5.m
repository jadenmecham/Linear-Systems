% Problem 5.1
A=[-6 -3 -5; 0 -3 1; 2 2 0];
B=[-2/3 1/3; 1/3 -2/3; 1/3 1/3];
C=[2 3 4; 2 1 3];
D=[0 0; 0 0];

contMat = [B A*B A^2*B];


% Controllable Subsys
Cext = [-2/3 1 4/3 -5/3 -8/3 0; 
    1/3 -2/3 -2/3 7/3 4/3 0; 
    1/3 1/3 -2/3 -2/3 4/3 1]
Tc = inv(Cext);

Atilde = Tc*A*inv(Tc);
Btilde = Tc*B;
Ctilde = C*inv(Tc);

% Observable Subsys
obsMat = [C; C*A; C*A^2];
Oext = [1 3 1; 1 5 1; 0 0 1];
Tc2 = Oext;
Atilde2 = Tc2*A*inv(Tc2);
Btilde2 = Tc2*B;
Ctilde2 = C*inv(Tc2);

% Both
Oboth = [Ctilde; Ctilde*Atilde; Ctilde*Atilde^2];
Obothext = [3 5 1; 5 7 1; 0 0 1];
Tcboth = Obothext;
Atildeboth = Tcboth*Atilde*inv(Tcboth);
Btildeboth = Tcboth*Btilde;
Ctildeboth = Ctilde*inv(Tcboth);
%% 
% Problem 5.2
P = [5 1; 1 1];
Pt=transpose(P)
eigvals = eig(P)




