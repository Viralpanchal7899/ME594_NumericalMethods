% Function to implement thomas algorithm
function x = thomas_alg(a,b,c,rhs)

n = length(rhs);

c(1) = c(1)/b(1);
rhs(1) = rhs(1)/b(1);
b(1) = 1;

for k=2:n
    
    b(k) = b(k) - a(k-1)*c(k-1);
    rhs(k) = rhs(k) - a(k-1)*rhs(k-1);
    
    if (k < n)
        c(k) = c(k)/b(k);
    end
    
    rhs(k) = rhs(k)/b(k);
    b(k) = 1;
end

x(n) = rhs(n);
for k = n-1:-1:1
    x(k) = (rhs(k) - (c(k) * x(k+1)));
end
x = x';

