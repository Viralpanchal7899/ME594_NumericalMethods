% generalised function to plot splines 
function spline_plot(t,y)

n = length(t) -1;

a = ones(n,1);
b = ones(n+1,1);
b = b*4;
b(1) = 2;
b(n+1) = 2;
c = ones(n,1);

rhs(1) = 3*(y(2) - y(1));
rhs(n+1) = 3* (y(n+1)- y(n));
for i = 2:n
    rhs(i) = 3*(y(i+1) - y(i-1));
end

d = thomas_alg(a,b,c,rhs);

aa = zeros(n,1);
bb = zeros(n,1);
cc = zeros(n,1);
dd = zeros(n,1);

for i = 1:n
    aa(i) = y(i);
    bb(i) = d(i);
    cc(i) = 3*(y(i+1)-y(i)) - 2*d(i) - d(i+1);
    dd(i) = 2*(y(i)-y(i+1))+d(i)+d(i+1);
end

u=linspace(0,1,101);

plot(t,y,'*-');
xlabel("t");
ylabel("y");
hold on
grid on
axis padded

for i=1:n
    tt = u*(t(i+1) - (t(i))) + t(i);
    yy = aa(i) + bb(i) * u(:) + cc(i) * u(:).^2 + dd(i) * u(:).^3;
    plot(tt,yy,'-k')
end

legend('Linear spline','Cubic spline')

