function z = Newton_z(h,y_k,x_k_p1)

tolerance = h^2/4;
z = y_k;
max_1 = 1000;

for j = 1:max_1
    p = z-feval('G_NS',z,h,y_k,x_k_p1)/feval('GP_NS',z,x_k_p1,h);
    
    error = abs(p-z);
    rel_error = 2*error/(abs(p)+abs(z));
    f = feval('G_NS',p,h,y_k,x_k_p1);
    z = p;
    
    if(error<tolerance)||(rel_error<tolerance)||(abs(f)<tolerance)
        break
    end
end
