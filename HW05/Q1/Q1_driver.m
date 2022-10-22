% Q1 driver
close all
clear all
clc

n = 25;
A = zeros(n);
A(1,1) = -2;
A(1,2) = 1;
A(n,n-1) = 1;
A(n,n) = -2;
for i=2:n-1
    A(i,i-1) = 1;
    A(i,i) = -2;
    A(i,i+1) = 1;
end

x0 = ones(n,1);
tol = 10^(-6);
max_iter = 1000;

[lambda_min,v_min,n_iter] = inverse_power(A,x0,tol,max_iter);
lambda_min
lamda_theoretical = -pi^2/(n+1)^2
v_min = [0 v_min' 0]';
x = linspace(0,1,n+2);
plot(x,v_min)
xlabel("x")
ylabel("y")
grid on 
title("Buckling deflection mode")
