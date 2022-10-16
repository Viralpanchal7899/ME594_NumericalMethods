function w = Jacobian(x)

a = x(1);
b = x(2);
c = x(3);
w = [2*a-1 2*b 2*c; 2*a 2*b-1 2*c; 2*a 2*b 2*c+1];
end
