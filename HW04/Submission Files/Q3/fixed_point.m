% Function for fixed point algorithm
function [P,rel_error,n_iters] = fixed_point(G,P,tol,max_iter)

% rel_error: relative error in the solution
% P: Initial guess during input and Fixed point approximation during
% output. 
% G = non linear system saved in it's own function file.

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
