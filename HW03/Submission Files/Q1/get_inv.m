% Making a function to get inverse of amatrix using Gaussian elimination (considering pivoting)

function A_inv = get_inv(A)

[p,q] = size(A);

if (p ~= q)
    fprintf('Error: Given matrix is not a suqare matrix \n');
    return 
end

A_aug = [A eye(p)];        % Augmented matrix

for i = 1:p-1
    [max_value, r] = max(abs(A_aug(i:p,i)));
    if (r>1)                            % pivoting condition
        temp_row = A_aug(i,:);
        A_aug(i,:) = A_aug(i+r-1,:);
        A_aug(i+r-1,:) = temp_row;
    end
    
    for j = i+1:p
        pivot = A_aug(j,i)/A_aug(i,i);
        A_aug(j,:) = A_aug(j,:)-pivot.*(A_aug(i,:));
    end
end

% Checking if matrix in not singular

if (norm(A_aug(p,1:p),'inf')< eps)
    fprintf('Error: Given matrix is singular \n');
    return
end

for k=1:p
    A_inv(p,k) = A_aug(p,p+k)/A_aug(p,p);
    for l=p-1:-1:1
        A_inv(l,k) = (A_aug(l,p+k) - A_aug(l,l+1:p) * A_inv(l+1:p,k))/A_aug(l,l);
    end
end

error = norm(A*A_inv - eye(p));
if (error < 10^(-10))
    fprintf('Inverse matrix achieved');
end
