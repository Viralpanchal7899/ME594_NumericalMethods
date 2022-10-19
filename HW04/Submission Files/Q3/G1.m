function z = G1(x)
z = zeros(1,2);
z(1) = (x(2)-(x(1)^3)+(3*x(1)^2))/4;
z(2) = -sqrt(x(1)+2);
end
