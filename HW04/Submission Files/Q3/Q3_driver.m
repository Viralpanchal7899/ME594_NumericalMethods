% Q3 driver

close all 
clear all
clc

tol = 10^(-6);
max_iter = 100;
P1 = [-0.3 -1.3];
[P1,rel_error_1,n_iters_1] = fixed_point('G1',P1,tol,max_iter);
fprintf("First point:\n");
disp(P1)
fprintf("Relative error: \n");
disp(rel_error_1)
fprintf("Number of iterations: \n");
disp(n_iters_1)

P2 = [0.3 1];
[P2,rel_error_2,n_iters_2] = fixed_point('G2',P2,tol,max_iter);
fprintf("Second point:\n");
disp(P2)
fprintf("Relative error: \n");
disp(rel_error_2)
fprintf("Number of iterations: \n");
disp(n_iters_2)