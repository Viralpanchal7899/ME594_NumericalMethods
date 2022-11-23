% Driver for Q2

close all
clear all
clc

a = 0;
b = 10;
h = 0.1;
n = (b-a)/h;

f1_0 = 0;
f2_0 = 0;
B = 1;

tolerance = 10^(-6)
xf30(1) = 0;
xf30(2) = 2;

[x,f2] = RK4('blasius',a,b,h,f1_0,f2_0,xf30(1));
yf210(1) = f2(n+1);

[x,f2] = RK4('blasius',a,b,h,f1_0,f2_0,xf30(2));
yf210(2) = f2(n+1);

error = abs(yf210(2) - B);
i = 3;

while(error>tolerance)
    xf30(i) = xf30(i-1) + (1-yf210(i-1)*(xf30(i-1)-xf30(i-2))/(yf210(i-1)-yf210(i-2));
    [x,f2]=RK4('blasius',a,b,h,f1_0,f2_0,xf30(i));
    yf210(i) = f2(n+1);
    
    error = abs(yf210(i)-B);
    i = i+1;
end

disp(error)

fpp_0 = xf30(i-1)

plot(f2,x)
xlabel('u/U')
ylabel('eta')

