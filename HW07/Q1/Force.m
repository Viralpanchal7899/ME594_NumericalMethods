function F = Force(t,v)

n = length(t);
dt = t(2) - t(1);
W = 2400;
g = 32.2;
m = W/g;
ms_per_s = 1000;
ft_per_mi = 5280;
s_per_h = 3600;

conv = ms_per_s*ft_per_mi/s_per_h;

F(1) = m*(-3*v(1)+4*v(2)-v(3))/(2*dt)*conv;
F(n) = m*(v(n-2)-4*v(n-1)+3*v(n))/(2*dt)*conv;
for i = 2:n-1
   F(i) = m*(v(i+1)-v(i-1))/(2*dt)*conv;
end
