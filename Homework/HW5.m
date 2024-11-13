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