% Function to perform QR iteration and determine the eigen values
function [eig_vals] = qr_iter(A)

for i=1:40
    [Q,R] = givens_qr(A);
    A = R * Q;
end

eig_vals = diag(A);