clear all
close all
clc

A = [0 1 0; 0 0 1; -2 5 6]
B = [0; 0; 1]

K = acker(A,B,[-2 -2 -3])