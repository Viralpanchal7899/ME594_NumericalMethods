function ef = ErrorFun(x)

dt = 0.2;
h = dt/2;
N = x/dt+1;

ef = zeros(1,N);
t = linspace(0,x,N);

ef(1) = 0;
for i = 2:N
    local_simp = h/3*(feval('IntFun',t(i-1))+ 4*feval('IntFun',t(i-1)+h) + feval('IntFun',t(i-1)+2*h));
    ef(i) = ef(i-1) + local_simp;
end

ef = ef.*2/sqrt(pi);
plot(t,ef)
xlabel('x')
ylabel('erf(x)')
