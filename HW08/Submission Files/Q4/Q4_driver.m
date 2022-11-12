% Q4 driver
clear all
close all
clc

a = 0;
b = 20;
h = 0.5;
y_ini = 0;

[x,y] = RK4('chem',a,b,h,y_ini);

n = round((b-a)/h)+1;
x_2 = linspace(a,b,n);
for i = 1:n
    y_2(i) = feval('Exact',x_2(i));
end
 
plot(x,y,'o',x_2,y_2)
xlabel('t(s)')
ylabel('y(millimoles/liter)')
axis padded
grid on
legend('RK4','Exact');
