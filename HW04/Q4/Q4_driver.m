%Q4 driver

close all
clear all
clc

eps = 10^-8;
max_iter = 100;
fprintf('Initial estimated point:\n');
P = [0 0 0]';
disp(P)

fprintf('Numerical solution: \n');
[P,iter,rel_error,est_error] = Newton('f','Jacobian', P, eps, max_iter)
