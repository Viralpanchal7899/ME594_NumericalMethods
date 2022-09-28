% Making function for bisection method 

function [c,error,f_c] = VDW_bisection(f,a,b,delta)

% f = function
% delta = tolerance
% c = root
% f_c = f(c)

f_a = feval(f,a);
f_b = feval(f,b);

while(f_a*f_b) > 0
    break
end
fprintf('  i         a          c          b          f(c) \n')
N = floor((log(b - a) - log(delta))/(log(2)));
for i = 1:N
    c = (a+b)/2;
    f_c = feval(f,c);
    fprintf('%3i %11.6f %11.6f %11.6f % 11.6f\n', i,a,c,b,f_c)
    if f_c == 0
        a = c;
        b = c;
    elseif f_c*f_b>0
        b = c;
        f_b = f_c;
    else
        a = c;
        f_a = f_c;
    end
end

fprintf('\n');
c = (a+b)/2;
error = abs(b-a);
f_c = feval(f,c);
