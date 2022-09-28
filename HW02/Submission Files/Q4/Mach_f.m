% Making a function for Mach number 'M'

function f = Mach_f(M)

eps = 10;
gamma= 1.4;
f = (1/M)*(2/(gamma+1)*(1+(gamma-1)/2*M^2))^((gamma+1)/2/(gamma-1))-eps;
