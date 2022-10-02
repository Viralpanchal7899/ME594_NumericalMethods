% Function for LU decomposition

function [L,U]  = LU_decompose(A)

[p,p] = size(A);
% lower triangle matrix
L = zeros(p,p);
L(1,1) = 1;
% Upper triangle matrix
U = A;

for i = 1:p-1
     if U(i,i) == 0
         fprintf('Pivoting required to reduce A to U(upper traingular matrix form)\n');
         break
     end
     
    L(i+1,i+1) = 1;
    for j = i+1:p
        L(j,i) = U(j,i)/U(i,i);
        U(j,i:p) = U(j,i:p) - L(j,i) * U(i,i:p);
    end
end

k = norm(L*U-A);
if (k < (10^(-10)))
    fprintf('No issues in performing LU decomposition');
end
