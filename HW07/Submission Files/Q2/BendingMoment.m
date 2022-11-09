% Function to compute the bending moment

function M = BendingMoment(x,y)

n = length(x);
dx = x(2)-x(1);

E = 29*10^6;
I = 720;
I_ft = 12;

M(1)=(2*y(1)-5*y(2)+4*y(3)-y(4))/dx^2*E*I/I_ft;
M(n) =(-1*y(n-3)+4*y(n-2)-5*y(n-1)+2*y(n))/dx^2*E*I/I_ft;

for i = 2:n-1    
    M(i) = (y(i-1)-2*y(i)+y(i+1))/dx^2*E*I/I_ft;
end

plot(x,M)
title('M v/s x')
xlabel('x(inch)')
ylabel('M(lbf*ft)')
grid on
