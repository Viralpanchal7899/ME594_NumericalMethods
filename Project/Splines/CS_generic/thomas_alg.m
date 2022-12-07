% Function to implement thomas algorithm
function D = thomas_alg(A,B,C,RHS)

N = length(RHS);

C(1) = C(1)/B(1);
RHS(1) = RHS(1)/B(1);
B(1) = 1;

for k=2:N
    B(k) = B(k) - A(k-1)*C(k-1);
    RHS(k) = RHS(k) - A(k-1)*RHS(k-1);
    
    if (k < N)
        C(k) = C(k)/B(k);
    end
    
    RHS(k) = RHS(k)/B(k);
    B(k) = 1;
end

D(N) = RHS(N);
for k = N-1:-1:1
    D(k) = (RHS(k) - (C(k) * D(k+1)));
end
D = D';
end


