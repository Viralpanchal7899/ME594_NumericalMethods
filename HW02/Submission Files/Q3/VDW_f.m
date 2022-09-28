% Q3 - Van Der Waal's equation

function f = VDW_f(V)

R = 0.08206;
n = 1.5;
a = 1.39;
b = 0.03913;
T = 298;
p = 13.5;

f = ((n*R*T)./(V-(n*b)))-(((n^2)*a)./(V.^2)) - p;