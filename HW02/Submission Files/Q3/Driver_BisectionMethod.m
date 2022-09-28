% Q3.1
% driver for bisection method

a = 2;
b = 3;

% delta = tolerance

delta = 10^(-6);
format long
[V,error,f_V] = VDW_bisection('VDW_f',a,b,delta) 