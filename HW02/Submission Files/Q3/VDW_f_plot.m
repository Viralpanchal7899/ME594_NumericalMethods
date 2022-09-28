% plotting van der waal's function
% To determine the range in which the roots belong to.

x = linspace(1,5,100);
y = VDW_f(x);
z = zeros(100);
plot(x,y,x,z)
grid on 