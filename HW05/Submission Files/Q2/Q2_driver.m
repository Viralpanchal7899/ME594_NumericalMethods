% Q2 driver
close all
clear all
clc

A = [2.5 -2 2.5 0.5
    0.5 5 -2.5 -0.5
    -1.5 1 3.5 -2.5
    2 3 -5 3]

[eig_vals] = qr_iter(A) 