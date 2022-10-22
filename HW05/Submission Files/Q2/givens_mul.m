% Function to make a givens multiple matrix
function A = givens_mul(A,i,j,c,s)

a = A(i,:);
b = A(j,:);

A(i,:) = (c*a)+(s*b);
A(j,:) = (-s*a)+(c*b);
