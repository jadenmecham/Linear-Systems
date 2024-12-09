clear all 
close all 
clc

% the system
A = [0 0 1 0 0; 1 0 0 2 0; 0 1 0 1 -1; 0 1 1 1 0; 2 0 1 0 0];
B = [1; 2; 1; 0; 1];
C = [1 0 0 0 0];

% desired poles
desired_poles = [-2 -3 -4 -5 -6];

% gain matrix L
L = place(A', C', desired_poles)'