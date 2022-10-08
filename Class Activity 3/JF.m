function W=JF(X,N,k,Wi,H0,X0)

L0=H0/(N+1);

phi=zeros(N+1,1);
s=zeros(N+1,1);

for i=1:N+1
  phi(i)=X(i);
  s(i)  =X(i+N+1);
end

W=zeros(2*N+2,2*N+2);

% i is row number, j is col number
for i=1:N

  % odd row, sum Fx
  W(2*i-1,i)      = k*s(i)  *sin(phi(i));
  W(2*i-1,i+1)    =-k*s(i+1)*sin(phi(i+1));
  W(2*i-1,N+1+i)  =-k*cos(phi(i));
  W(2*i-1,N+1+i+1)= k*cos(phi(i+1));

  % even row, sum Fy
  W(2*i,i)      =-k*s(i)  *cos(phi(i));
  W(2*i,i+1)    = k*s(i+1)*cos(phi(i+1));
  W(2*i,N+1+i)  =-k*sin(phi(i));
  W(2*i,N+1+i+1)= k*sin(phi(i+1));

end

for j=1:N+1

  W(2*N+1,j)    =-(s(j)+L0)*sin(phi(j));
  W(2*N+1,N+1+j)= cos(phi(j));
  W(2*N+2,j)    = (s(j)+L0)*cos(phi(j));
  W(2*N+2,N+1+j)= sin(phi(j));

end

