% Function to perform QR iteration
function [eig_vals] = qr_iter(A)

for i=1:20
    [Q,R] = hhr_qr(A);
    A = R*Q;
end

eig_vals = diag(A);
end

