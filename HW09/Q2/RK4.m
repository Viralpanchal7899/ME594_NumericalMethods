function [x,f2] = RK4(ODE,a,b,h,f1_0,f2_0,f3_0)

n = (b-a)/h;
x = zeros(1,n+1);
f1 = zeros(1,n+1);
f2 = zeros(1,n+1);
f3 = zeros(1,n+1);
K = zeros(3,4);

x(1) = a;
f1(1) = f1_0;
f2(1) = f2_0;
f3(1) = f3_0;

for i = 1:n
    x(i+1) = x(i) + h;
    [K(:,1)] = feval(ODE,x(i),f1(i),f2(i),f3(i));
    [K(:,2)] = feval(ODE,x(i)+0.5*h,f1(i)+0.5*K(1,1)*h,f2(i)+0.5*K(2,1)*h,f3(i)+0.5*K(3,1)*h);
    [K(:,3)] = feval(ODE,x(i)+0.5*h,f1(i)+0.5*K(1,2)*h,f2(i)+0.5*K(2,2)*h,f3(i)+0.5*K(3,2)*h);
    [K(:,4)] = feval(ODE,x(i)+h,f1(i)+K(1,3)*h,f2(i)+K(2,3)*h,f3(i)+K(3,3)*h);
    
    f1(i+1) = f1(i) + 1/6*(K(1,1)+2*K(1,2)+2*K(1,3)+K(1,4))*h;
    f2(i+1) = f2(i) + 1/6*(K(2,1)+2*K(2,2)+2*K(2,3)+K(2,4))*h;
    f3(i+1) = f3(i) + 1/6*(K(3,1)+2*K(3,2)+2*K(3,3)+K(3,4))*h;
end
