% Q4
% Driver for Regula falsi fuunction

a = 10^(-2);
b = 1;
delta = 10^(-6);
eps = 10^(-8);
max_i = 1000;

[M,error,f_M] = Regula_falsi('Mach_f',a,b,delta,eps,max_i)

fprintf('\n ************************************************* \n\n');
a = 1;
b = 5;

[M,error,f_M] = Regula_falsi('Mach_f',a,b,delta,eps,max_i)
