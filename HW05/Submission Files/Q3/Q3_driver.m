% Q3 driver
close all
clear all
clc

A = [7 6 -3
    -12 -20 24
    -6 -12 16]

[eig_vals] = qr_iter(A)