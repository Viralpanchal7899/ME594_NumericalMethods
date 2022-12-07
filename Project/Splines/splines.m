% Program for curve fitting using splines

close all
clear all
clc

data = readtable('test.csv');
% data = readtable('')
% Raw plot
% solving for velocity measured in x direction wrt time

plot(data.SampleTimeFine, data.dv_1_,'o')
hold on
plot(data.SampleTimeFine, data.dv_1_,'r','LineWidth',1)
grid on
axis padded
legend('raw data')

% Defining abscissa and ordinates
X = length(data.SampleTimeFine);
Y = length(data.dv_1_);

t(2:X+1,1)= data.SampleTimeFine;
t(1,1) = 0;
t(X+2,1) = 0;
y(2:Y+1,1) = data.dv_1_;
y(1,1)= 0;
y(Y+2,1) = 0;

% Tridiagonal matrix
Tridiagonal_mat = zeros(X+2,Y+2);
Tridiagonal_mat(1,1) = 2;
Tridiagonal_mat(X+2,Y+2) = 2;

for i = 2:X+2
    Tridiagonal_mat(i,i-1) = 1;
    Tridiagonal_mat(i-1,i) = 1;
    if i>1 && i<X+2
        Tridiagonal_mat(i,i) = 4;
    end
end

% Making Y mat
Y_mat = zeros(X+2,1);
Y_mat(1,1) = 3*(y(2,1)-y(1,1));
Y_mat(X+2,1) = 3*(y(X+2,1)-y(X+2,1));

for i = 2:X+1
    Y_mat(i,1) = 3 * (y(i+1) - y(i-1));
end

% Getting D_i_mat
D_i_mat = zeros(X+2,1);
D_i_mat = inv(Tridiagonal_mat) * Y_mat;


% SOlving for polynomial coefficients a_i,b_i,c_i,d_i
a_i = y;
b_i = D_i_mat;
c_i = zeros();
d_i = zeros();

% c_i and d_i
for i = 1:X+1
    c_i(i,1) = 3*(y(i+1,1)-y(i,1)) - 2*D_i_mat(i,1) - D_i_mat(i+1,1);
    d_i(i,1) = 2*(y(i,1) - y(i+1,1)) - D_i_mat(i,1) + D_i_mat(i+1,1);
end

% polynomial P_i coefficients
P_i_coeff = zeros();
for i = 1:X+1
    P_i_coeff(i,1:4) = [a_i(i,1) b_i(i,1) c_i(i,1) d_i(i,1)];
end
 
% Polynomial P_i
P_i = zeros();
u = 0.1;
for i = 1:X+1
    P_i(i,1) = P_i_coeff(i,1) + P_i_coeff(i,2)*u + P_i_coeff(i,3)*u^2 + P_i_coeff(i,4) * u^3;
end

hold on 
plot(data.SampleTimeFine,P_i(2:X+1,1),'k','LineWidth',1)

