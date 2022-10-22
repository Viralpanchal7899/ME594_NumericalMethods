% Function to decompose A using Givens method
function [Q,R] = givens_qr(A)

[n,n] = size(A);
Q = eye(n);

for i = 1:n-1
    for j=i+1:n
        [c,s] = givens_params(A(i,i),A(j,i));
        A = givens_mul(A,i,j,c,s);
        Q = givens_mul(Q,i,j,c,s);
    end
end

R = A;
Q = Q';
