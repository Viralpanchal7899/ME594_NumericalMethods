format long
% a = eps/d 
a = 0.005;
Re = 10^8;
i = 1;
f(i,1)= 1; 
e = 10; 
while e >= 0.00001
    f(i+1,1) = 1/(log(1/((a/3.7)+(2.51/(Re*sqrt(f(i,1)))))^2))^2;
    e = f(i,1) - (f(i+1,1));
    i = i+1;
    
end

