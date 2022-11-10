function [x,y] = RK4(ode,a,b,h,y_ini)


n = round((b-a)/h)+1;
y = zeros(1,n);

x = linspace(a,b,n);
y(1) = y_ini;

for i = 1:n-1
    k(1:4) = 0;
    k(1) = feval(ode,x(i),y(i));
    k(2) = feval(ode,x(i)+0.5*h,y(i)+0.5*k(1)*h);
    k(3) = feval(ode,x(i)+0.5*h,y(i)+0.5*k(2)*h);
    k(4) = feval(ode,x(i)+h,y(i)+k(3)*h);
    
    y(i+1) = y(i) + 1/6*(k(1)+2*k(2)+2*k(3)+k(4))*h;
end
