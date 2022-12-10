% Function to for lagrange interpolation
function y_l = lagrange(x,y,N,x_l) 

% N --> Number of samples
%y_l --> y/f(x) computed from lagrange method

y_l = 0;

for i = 1:N
    p = 1; 
    for j = 1:N
        if i ~= j
            p = p*(x_l-x(j,1))/(x(i,1)-x(j,1));
        end
    end
    y_l = y_l + p*y(i,1);
end
end
