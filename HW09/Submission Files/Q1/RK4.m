% Function to imple Runge-Kutta method

function [x,y,z] = RK4(ODE,a,b,h,x0,y0,z0)

n = (b-a)/h;
t = zeros(1,n+1);
x = zeros(1,n+1);
y = zeros(1,n+1);
z = zeros(1,n+1);

K = zeros(3,4);

t(1) = a;
x(1) = x0;
y(1) = y0;
z(1) = z0;

for i = 1:n
    t(i+1) = t(i) + h;
    [K(:,1)] = feval(ODE,x(i),y(i),z(i));
    [K(:,2)] = feval(ODE,x(i)+0.5*K(1,1)*h,y(i)+0.5*K(2,1)*h,z(i)+0.5*K(3,1)*h);
    [K(:,3)] = feval(ODE,x(i)+0.5*K(1,2)*h,y(i)+0.5*K(2,2)*h,z(i)+0.5*K(3,2)*h);
    [K(:,4)] = feval(ODE,x(i)+K(1,3)*h,y(i)+K(2,3)*h,z(i)+K(3,3)*h);
    x(i+1) = x(i) + 1/6*(K(1,1)+2*K(1,2)+2*K(1,3)+K(1,4))*h;
    y(i+1) = y(i) + 1/6*(K(2,1)+2*K(2,2)+2*K(2,3)+K(2,4))*h;
    z(i+1) = z(i) + 1/6*(K(3,1)+2*K(3,2)+2*K(3,3)+K(3,4))*h;
end

plot(t,x);
xlabel('t');
ylabel('x');
axis padded
grid on

figure
plot(t,y)
xlabel('t')
ylabel('y')
axis padded
grid on

figure
plot(t,z)
xlabel('t')
ylabel('z')
axis padded
grid on

figure
plot(x,y)
xlabel('x')
ylabel('y')
axis padded
grid on

figure
plot(x,z)
xlabel('x')
ylabel('z')
axis padded
grid on

fprintf('Equilibrium point: \n\n')
disp([x(n+1),y(n+1),z(n+1)])