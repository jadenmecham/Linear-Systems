clear all 
close all
clc
syms s

A = [0 1; -5 -1];
B = [0; 0.5];
C = [1 0];
D = [0];

SI = [s 0; 0 s];
I = [1 0; 0 1];

K = [-6 2];

contMat = [B A*B];
contMatCheck = ctrb(A,B);

DynCl = A - B*K;
poles = eig(DynCl);

Gcl = C * inv((SI - (DynCl))) * B;
sys = ss(DynCl, B, C, D);
Gclcheck = tf(sys);

Ack2 = (A')^2+8*A'+32*I;
C2 = [C' A'*C'];

K = [0 1]*inv(C2)*Ack2
