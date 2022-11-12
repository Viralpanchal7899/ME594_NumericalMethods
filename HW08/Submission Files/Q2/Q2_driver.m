% Q2 Driver
clear all
close all
clc

x_0 = 1;
y_0 = 1;
x_n = 20;

for i = 1:3
    h = 1/2^i;
    n = (x_n-x_0)/h;
    
    x = zeros(1,n+1);
    y = zeros(1,n+1);
    
    x = x_0:h:x_n;
    y(1) = y_0;
    for k = 1:n
        z = y(k);
        y(k+1) = Newton_z(h,z,x(k+1));
    end
    plot(x,y,'color',rand(1,3))
    hold on
end

y_exact = zeros(1,n+1);
y_exact(1) = y_0;
for k = 2:n+1
    y_exact(k) = (1+x(k).^2).^(-.5);
end

plot(x,y_exact)
title('Implicit Euler')
axis padded 
grid on
xlabel('x')
ylabel('y')
legend('h=0.5','h=0.25','h=0.125','Exact')
