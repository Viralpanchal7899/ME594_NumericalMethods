function Z=F(X,N,k,Wi,H0,X0)

phi=zeros(N+1,1);
s=zeros(N+1,1);

for i=1:N+1
  phi(i)=X(i);
  s(i)  =X(i+N+1);
end


Z=zeros(2*N+2,1);

% Unstretched length of mooring line is H0.
% So unstretched length of each spring is H0/(N+1)
L0=H0/(N+1); 

for i=1:N
  Z(2*i-1)=k*s(i+1)*cos(phi(i+1))-k*s(i)*cos(phi(i));
  Z(2*i)  =k*s(i+1)*sin(phi(i+1))-k*s(i)*sin(phi(i))-Wi; 
end

%Special Case: Boundary Conditions
Z(2*N+1)=-X0;
Z(2*N+2)=-H0;

% No special case needed for the last one as s_p is s(N+1)
for i=1:N+1
  Z(2*N+1)=Z(2*N+1)+(s(i)+L0)*cos(phi(i));
  Z(2*N+2)=Z(2*N+2)+(s(i)+L0)*sin(phi(i));
end


