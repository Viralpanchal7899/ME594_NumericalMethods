clear  % make sure to clear the variables from memory first

%--------------------
% Tunable parameters
%--------------------

N=10;         % Number of masses modeling the mooring line
%for N=5:5:30
H0=10;        % Height of domain [m]
X0=10;	      % Initial horizontal position of platform relative to anchor [m]
FF=1.5;       % Dimensionless ratio of forces 
              % FF = spring force / weight force
              %    = k*L0/Wtot 
              %    = (E*A/L0)*L0/Wtot 
              %    = E*A/Wtot
Wtot=100;     % Total weight of mooring line [N]
EA=FF*Wtot;    % E is modulus of elasticity, A is cross sectional area
              % Only the product E*A is important
L0=H0/(N+1);  % Unstretched length of all springs [m]
k=EA/L0;      % Spring constant [N/m]; ki=EiAi/Li [Raju's paper]

%----------------------------
% Initial guess of variables
%----------------------------

phi_init=atan(H0/X0);	% Initial guess of angles, all equal, assumed straight line connection
L_tot=sqrt(H0^2+X0^2);	% Total length connecting anchor to platform
L_init=L_tot/(N+1);	% Initial length of segments between masses
s_init=L_init-L0;	% Initial stretch in 

%-----------------------------------------------------------------------
% P is the initial guess, a vector
% The angles (phi's) are the first N+1 variables, 
% and the stretches are the last N+1 variables.
% Note that these variables were redefined to be the stretch
% beyond the equilibrium length, and not the distance along the path.
%-----------------------------------------------------------------------

P=zeros(2*N+2,1);	
for i=1:N+1
 P(i)=phi_init;
 P(N+1+i)=s_init;
end

%----------------------
% Convergence Criteria
%----------------------
epsilon=10^-6;
max1=100;

[P,iter,err]=newton('F','JF',P,epsilon,max1,N,H0,X0,Wtot,k);

% Plot using P
xx=zeros(N+2,1);
zz=zeros(N+2,1);
xx(1)=0;
zz(1)=0;

for i=1:N+1

  xx(i+1)=xx(i)+(P(N+1+i)+L0)*cos(P(i));
  zz(i+1)=zz(i)+(P(N+1+i)+L0)*sin(P(i));

end

plot(xx,zz,'-o')
hold on
xlabel("x [m]")
ylabel("z [m]")
%end % end N-loop
%print -dpdf Config.pdf

