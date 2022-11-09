% Script to solve using trapezoid method
function Q = Trapezoid(v)

R = 2;
n = length(v);
h = R/(n-1);
r = linspace(0,R,n);

Q = 0;
for i = 1:n-1
    Q = Q+0.5*(v(i)*r(i)+v(i+1)*r(i+1));
end
Q = Q*2*pi*h;

