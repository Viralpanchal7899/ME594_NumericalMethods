%Driver Q3
% This driver includes the program for both the Trapezoid and Euler method.
% The first output figure is for the trapezoid method followed by the
% modifiied euler method. 
clear all
close all
clc


% For trapezoid method
x_0 = 1;
y_0 = 1;
x_n = 5;

for i = 0:2
    
    h = 0.8/2^i;
    n = round((x_n-x_0)/h);
    x = zeros(1,n+1);
    y = zeros(1,n+1);
    
    x = x_0:h:x_n;
    y(1) = y_0;
    for k = 1:n
        y(k+1) = feval('Trapezoid',x(k),x(k+1),y(k),h);
    end
    plot(x,y,'color',rand(1,3))
    hold on 
end

y_exact = zeros(1,n+1);
y_exact(1) = y_0;
for k = 2:n+1
    y_exact(k) = 2-exp(((1-x(k).^2)/4));
end

plot(x,y_exact)
title('Trapezoid')
axis padded
xlabel('x')
ylabel('y')
legend('h=0.8','h=0.4','h=0.2','Exact')

figure


% For Euler method
% Need to redefine the initial values to overide magnitudes from previous
% method
x_0 = 1;
y_0 = 1;
x_n = 5;

for i = 0:2
    
    h = 0.8/2^i;
    n = round((x_n-x_0)/h);
    x = zeros(1,n+1);
    y = zeros(1,n+1);
    
    x = x_0:h:x_n;
    y(1) = y_0;
    for k = 1:n
        y_star = y(k) + h*(x(k) - x(k)*y(k)/2);
        y(k+1) = y(k) + 0.5 * h* (feval('Euler',x(k),y(k))+feval('Euler',x(k+1),y_star));
    end
    plot(x,y,'color',rand(1,3))
    hold on 
end

y_exact = zeros(1,n+1);
y_exact(1) = y_0;
for k = 2:n+1
    y_exact(k) = 2-exp((1-x(k).^2)/4);
end

plot(x,y_exact)
title('Euler')
xlabel('x')
ylabel('y')
axis padded
legend('h=0.8','h=0.4','h=0.2','Exact');
