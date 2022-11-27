% Implementing Blasius method
function fp = blasius(x,f1,f2,f3) 

fp(1) = f2;
fp(2) = f3;
fp(3) = -0.5*f1*f3;
