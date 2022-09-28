%Q 3.2
% driver for secant method

p0 = 2;
p1 = 2.1;
delta = 10^(-6);
eps = 10^(-6);
max_i = 100;

format long
[V,i,error,rel_error,f_V] = VDW_secant('VDW_f',p0,p1,delta,eps,max_i)