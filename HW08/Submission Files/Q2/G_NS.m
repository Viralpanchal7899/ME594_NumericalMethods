% G for newton solver
function f = G_NS(z,h,y_k,x_k_p1)

f = h*x_k_p1*z^3+z-y_k;

end
