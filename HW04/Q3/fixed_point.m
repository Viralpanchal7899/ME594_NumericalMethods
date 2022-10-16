function [P,rel_error,n_iters] = fixed_point(G,P,tol,max_iter)

n = length(P);

for i = 1:max_iter
    x = feval(G,P);
    error = norm(x-P);
    rel_error = error/(norm(x) + eps);
    P = x;
    n_iters = i;
    if (rel_error<tol)
        break
    end
end
