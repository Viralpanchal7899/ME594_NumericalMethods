% Script to solve using Simpson's method
function Q = Simpsons(v)

R = 2;
n = length(v);
h = R/(n-1);
r = linspace(0,R,n);

Q = 0;
for i=1:2:n-2
    Q = Q + (v(i)*r(i)+4*v(i+1)*r(i+1)+v(i+2)*r(i+2));
end
Q = Q*2*pi*h/3;
