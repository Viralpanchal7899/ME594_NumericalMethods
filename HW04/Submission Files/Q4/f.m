% Given equations for the system
function z = f(x)

a = x(1);
b = x(2);
c = x(3);
z = zeros(3,1);
z(1) = a^2 - a + b^2 + c^2 -5;
z(2) = a^2 + b^2 - b + c^2 -4;
z(3) = a^2 + b^2 + c^2 + c - 6;
end
