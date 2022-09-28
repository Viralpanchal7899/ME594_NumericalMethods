% function for regula falsi method

function [c,error,f_c] = Regula_falsi(f,a,b,delta,eps,max_i)

f_a = feval(f,a);
f_b = feval(f,b);

while f_a*f_b > 0
    fprintf('Breaking since f(a)*f(b)>0 \n')
    break;
end
for i = 1:max_i
    dx = f_b*(b-a)/(f_b - f_a);
    c = b - dx;
    a_c = c - a;
    f_c = feval(f,c);
    fprintf('%3i %11.6f % 11.6f % 11.6f % 11.6f \n', i,a,c,b,f_c)
    if f_c == 0
        break;
    elseif f_b*f_c > 0
        b = c;
        f_b = f_c;
    else
        a = c;
        f_a = f_c;
    end
    
    dx = min(abs(dx),a_c);
    if (abs(dx) < delta)
        fprintf('Difference between the iterates is less than the tolerance \n')
        break;
    end
end
error = abs(b-a/2);
f_c = feval(f,c);
end

        