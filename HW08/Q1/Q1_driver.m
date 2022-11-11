% Q1 driver
% This driver runs both Explicit and Implcit Euler method outputs pplot for
% both individually.
clear all
close all
clc
% for Explicit Euler method

x_0 = 0;
y_0 = 1;
x_n = 6;

for i = 0:3
    h = 0.4/2^i;
    n=(x_n-x_0)/h;
    x = zeros(1,n+1);
    y = zeros(1,n+1);
    
    x = x_0:h:x_n;
    y(1) = y_0;
    for k = 1:n
        y(k+1) = feval('Explicit_euler',x(k),y(k),h);
    end
    
    plot(x,y,'color',rand(1,3))
    
    hold on
    
end

y_exact = zeros(1,n+1);
y_exact(1) = y_0;
for k = 2:n+1
    y_exact(k) = exp(-x(k).^2);
end

plot(x,y_exact)
title('Explicit error')
axis padded
grid on
xlabel('x')
ylabel('y')
legend('h = 0.4','h =0.2','h=0.1','h=0.5','exact')


figure 

% For Implicit Euler method
% Redefing the initial variables to override the magnitudes of certain
% variables from the previous metthod. 
x_0 = 0;
y_0 = 1;
x_n = 6;

for i = 0:3
    h = 0.4/2^i;
    n=(x_n-x_0)/h;
    x = zeros(1,n+1);
    y = zeros(1,n+1);
    
    x = x_0:h:x_n;
    y(1) = y_0;
    for k = 1:n
        y(k+1) = feval('Implicit_euler',x(k+1),y(k),h);
    end
    
    plot(x,y,'color',rand(1,3))
    
    hold on
    
end

y_exact = zeros(1,n+1);
y_exact(1) = y_0;
for k = 2:n+1
    y_exact(k) = exp(-x(k).^2);
end

plot(x,y_exact)
title('Implicit error')
axis padded
grid on
xlabel('x')
ylabel('y')
legend('h = 0.4','h =0.2','h=0.1','h=0.5','exact')


