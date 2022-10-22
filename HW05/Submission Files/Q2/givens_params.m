% Functions to determine the givens parameters (c,s)
function [c,s] = givens_params(x_i,x_j)

if (x_j==0)
    c = 1;
    s = 0;
elseif (abs(x_j)>abs(x_i))
    t = x_i/x_j;
    s = 1/sqrt(1+t^2);
    c = s*t;
else
    t = (x_j)/(x_i);
    c = 1/sqrt(1+t^2);
    s = c*t;
end
