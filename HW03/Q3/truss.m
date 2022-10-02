% Making a function to compute the forces necessary to hold the trusses in
% quilibirum

function x = truss(A,B)

[p,q] = size(A);
r = length(B);
x = zeros(q,1);

if (p ~= q)
    fprintf('Given matrix is not square \n');
    return
end

if (r ~= q)
    fprintf('Given matrix and vector is not compatible \n');
    return
end

A_aug = [A B];
for i=1:q-1
    [max_value,j] = max(abs(A_aug(i:q,i)));
    if (j>1)
        temp_row = A_aug(i,:);
        A_aug(i,:) = A_aug(i+j-1,:);
        A_aug(i+j-1,:) = temp_row;
    end
    
    for k = i+1:q
        pivot = A_aug(k,i)/A_aug(i,i);
        A_aug(k,:) = A_aug(k,:) - pivot.*A_aug(i,:);
    end
end

if (norm(A_aug(q,1:q),'inf') < eps)
    fprintf('Given matrix in not singluar');
    return
end

x(q) = A_aug(q,q+1)/A_aug(q,q);
for l = q-1:-1:1
    x(l) = (A_aug(l,q+1)-A_aug(l,l+1:q)*x(l+1:q))/A_aug(l,l);
end
