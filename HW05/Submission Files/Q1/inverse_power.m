% Function to determine smallest eigen value and its eigen vector using
% inverse power method. 
function [lambda_n,v_n,n_iter] = inverse_power(A,x0,tol,max_iter)

[n,n] = size(A);
P = eye(n);
L = zeros(n,n);
L(1,1) = 1;
u = A;

for i = 1:n-1
    [max_element,k] = max(abs(u(i:n,i)));
    if (k > 1)
        temp_row = u(i,:);
        u(i,:) = u(i+k-1,:);
        u(i+k-1,:) = temp_row;
        
        temp_row = P(i,:);
        P(i,:) = P(i+k-1,:);
        P(i+k-1,:) = temp_row;
    end
    
    L(i+1,i+1) = 1;
    
    for j = i+1:n
        pivot = u(j,i)/u(i,i);
        L(j,i) = pivot;
        u(j,i:n) = u(j,i:n) - pivot.*u(i,i:n);
    end
end

x_k = x0/norm(x0);
y=zeros(n,1);
for k = 1:max_iter
    b = P*x_k;
    y(1) = b(1)/L(1,1);
    for i=2:n
        y(i) = (b(i)-L(i,1:i-1)*y(1:i-1))/L(i,i);
    end
    
    x_k(n) = y(n)/u(n,n);
    for i = n-1:-1:1
        x_k(i) = (y(i)-u(i,i+1:n)*x_k(i+1:n))/u(i,i);
    end
    x_k = x_k/norm(x_k);
    lambda_n = x_k'*A*x_k;
    error = norm(A*x_k-lambda_n*x_k);
    if (error < tol)
        v_n = x_k;
        n_iter = k;
        break
    end
    v_n = x_k;
    n_iter = -1;
end
