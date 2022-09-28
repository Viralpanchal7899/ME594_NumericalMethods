% Making function for secant method 

function [P,i,error, rel_error, f_p] = VDW_secant(f,p0,p1,delta,eps,max_i)

% f = function
% p0, p1 = Initial approximated roots
% delta = tolerance within iterations
% eps = tolerance in function 
% max_i = maximum iterations
% P = approximated root
% i = iterations
% f_p = f(p)


fprintf('  i        p0          p1        p2           f(c) \n');
for i = 1:max_i
    p2  = p1 - (feval(f,p1)*(p1-p0))/(feval(f,p1) - feval(f,p0));
    fprintf('%3i %11.6f %11.6f %11.6f %11.6f \n',i,p0,p1,p2,feval(f,p2))
    error = abs(p2-p1);
    rel_error = (2*error)/(abs(p2)+abs(p1));
    p0 = p1;
    p1 = p2;
    f_p = feval(f,p1);
    if (error<delta) | (rel_error<delta) | (abs(f_p)<eps)
        break;
    end
end

fprintf('\n')

P = p1;