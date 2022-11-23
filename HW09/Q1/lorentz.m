function dVdt = lorentz(x,y,z)

r = 21;
b = 8/3;
sigma = 10;

dVdt(1) = sigma*(-x+y);
dVdt(2) = r*x-y-x*z;
dVdt(3) = -b*z + x*y;

