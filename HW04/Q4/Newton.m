function [P,iter,rel_error,est_error] = Newton(f,Jacobian,P,eps,max_iter)

n=length(P);
y=feval(f,P);

for i = 1:max_iter
    jacobian = feval(Jacobian,P);
    aug_mat = [jacobian -y];
    delta_P = zeros(n,1);
    
    for j = 1:n-1
        [max_element,k] = max(abs(aug_mat(j:n,j)));
        if (k>1)
            temp_row = aug_mat(j,:);
            aug_mat(j,:) = aug_mat(j+k-1,:);
            aug_mat(j+k-1,:) = temp_row;
        end
        for l = j+1:n
            pivot = aug_mat(l,j)/aug_mat(j,j);
            aug_mat(l,:) = aug_mat(l,:)-pivot.*aug_mat(j,:);
        end
    end
    
    % Not to do back substitution
    delta_P(n) = aug_mat(n,n+1)/aug_mat(n,n);
    for m = n-1:-1:1
        delta_P(m) = (aug_mat(m,n+1)-aug_mat(m,m+1:n)*delta_P(m+1:n))/aug_mat(m,m);
    end
    
    temp_point = P + delta_P;
    y=feval(f,temp_point);
    
    error = norm(temp_point-P);
    rel_error = error/(norm(temp_point)+eps);
    est_error = norm(y);
    
    P = temp_point;
    iter = i;
    if(rel_error<eps || (est_error<eps))
        break
    end
end
