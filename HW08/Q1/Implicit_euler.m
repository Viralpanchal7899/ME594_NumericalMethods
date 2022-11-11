% Implicit Euler function

function f = Implicit_euler(x_k_p1,y_k,h)

f = y_k/(1+2*x_k_p1*h);

end
