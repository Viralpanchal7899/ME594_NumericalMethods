% Making a function for Thomas algorithm 

function x = thomas_alg(a,b,c,rhs)

p = length(rhs);

c(1) = c(1)/b(1);
rhs(1) = rhs(1)/b(1);
b(1) = 1;

for i = 2:p
    b(i) = b(i) - a(i-1)*c(i-1);
    rhs(i) = rhs(i) - (a(i-1) * rhs(i-1));
    if (i < p)
        c(i) = c(i)/b(i);
    end
    rhs(i) = rhs(i)/b(i);
    b(i) = 1;
end

% Gaussian elimination done.
% performing back substitution now

x(p) = rhs(p);
for j = p-1:-1:1
    x(j) = (rhs(j)-(c(j)*x(j+1)));
end
x = x';
