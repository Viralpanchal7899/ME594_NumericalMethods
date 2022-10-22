function [V,D,num_sweeps] = jacobi_cyclic(A,eps,max_sweeps)

D=A;
[n,n] = size(A);
V = eye(n);
num_sweeps = 0;
tol_reached = false;

while((num_sweeps <= max_sweeps) && (~tol_reached))
    for i = 1:n-1
        for j = i+1:n
           tau = (D(j,j) - D(i,i))/2/D(i,j);
           if (tau >= 0)
               t = 1/(tau + sqrt(tau^2 + 1));
           else
               t = -1/(-tau + sqrt(tau^2 + 1));
           end           
           c = 1/sqrt(1+t^2);
           s = c*t;
           
           R = [c s; -s c];
           D([i j],:) = R'*D([i j],:);
           
           D(:,[i j]) = D(:,[i j])*R;
           
           V(:,[i j]) = V(:,[i j])*R;
        end
    end
    
    off_A = 0;
    for i = 1:n-1
        for j = i+1:n
            off_A = off_A + D(i,j)^2;
        end
    end
    
    off_A = sqrt(2*off_A);
    if (off_A < eps)
        tol_reached = true;
    end
    num_sweeps = num_sweeps + 1;
end

D = diag(diag(D));

    