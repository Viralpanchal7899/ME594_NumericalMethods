% Q4 driver

close all
clear all
clc

A = [-8 16 23 -13
    16 9 2 3
    23 2 1 -23
    -13 3 -23 -7]

eps = 10^(-6);
max_sweeps = 100;

[V,D,num_sweeps] = jacobi_cyclic(A,eps,max_sweeps)