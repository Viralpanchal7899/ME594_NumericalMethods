% Program for curve fitting using splines

close all
clear all
clc

data = readtable('test.csv');

% Raw plot
% solving for velocity measured in x direction wrt time

plot(data.SampleTimeFine, data.dv_1_,'o')
hold on
plot(data.SampleTimeFine, data.dv_1_,'r')
grid on
axis padded
legend('raw data')

% Defining abscissa and ordinates
t(2:length(data.SampleTimeFine)+1,1)= data.SampleTimeFine;
t(1,1) = 0;
t(length(data.SampleTimeFine)+2,1) = 0;
y(2:length(data.dv_1_)+1,1) = data.dv_1_;
y(1,1)= 0;
y(length(data.dv_1_)+2,1) = 0;

% Tridiagonal matrix
Tridiagonal_mat = zeros(743,743);
Tridiagonal_mat(1,1) = 2;
Tridiagonal_mat(743,743) = 2;

for i = 2:743
    Tridiagonal_mat(i,i-1) = 1;
    Tridiagonal_mat(i-1,i) = 1;
    if i>1 && i<743
        Tridiagonal_mat(i,i) = 4;
    end
end

% Making Y mat
Y_mat = zeros(743,1);
Y_mat(1,1) = 3*(y(2,1)-y(1,1));
Y_mat(743,1) = 3*(y(743,1)-y(742,1));

for i = 2:742
    Y_mat(i,1) = 3 * (y(i+1) - y(i-1));
end

% Getting D_i_mat
D_i_mat = zeros(743,1);
D_i_mat = inv(Tridiagonal_mat) * Y_mat;


% SOlving for polynomial coefficients a_i,b_i,c_i,d_i
a_i = y;
b_i = D_i_mat;
c_i = zeros();
d_i = zeros();

% c_i and d_i
for i = 1:742
    c_i(i,1) = 3*(y(i+1,1)-y(i,1)) - 2*D_i_mat(i,1) - D_i_mat(i+1,1);
    d_i(i,1) = 2*(y(i,1) - y(i+1,1)) - D_i_mat(i,1) + D_i_mat(i+1,1);
end

% polynomial P_i coefficients
P_i_coeff = zeros();
for i = 1:742
    P_i_coeff(i,1:4) = [a_i(i,1) b_i(i,1) c_i(i,1) d_i(i,1)];
end
 
% Polynomial P_i
P_i = zeros();
u = 0.5;
for i = 1:742
    P_i(i,1) = P_i_coeff(i,1) + P_i_coeff(i,2)*u + P_i_coeff(i,3)*u^2 + P_i_coeff(i,4) * u^3;
end

hold on 
plot(data.SampleTimeFine,P_i(2:742,1))

% % Solving for U
% u = zeros();
% for i = 1:length(t)
%     u(i,1) = (t(i))
% 
% 
% sigma_x = 0;
% sigma_y = 0;
% sigma_xy = 0;
% sigma_x2y = 0;
% sigma_x3y = 0;
% sigma_x4y = 0;
% sigma_x2 = 0;
% sigma_x3 = 0;
% sigma_x4 = 0;
% sigma_x5 = 0;
% sigma_x6 = 0;
% sigma_x7 = 0;
% sigma_x8 = 0;
% 
% for i = 1:length(x)
%     sigma_x = x(i) + sigma_x;
%     sigma_y = y(i) + sigma_y;
%     sigma_xy = x(i)*y(i) + sigma_xy;
%     sigma_x2y = x(i)^2 * y(i) + sigma_x2y;
%     sigma_x3y = x(i)^3 * y(i) + sigma_x3y;
%     sigma_x4y = x(i)^4 * y(i) + sigma_x4y;
%     sigma_x2 = x(i)^2 + sigma_x2;
%     sigma_x3 = x(i)^3 + sigma_x3;
%     sigma_x4 = x(i)^4 + sigma_x4;
%     sigma_x5 = x(i)^5 + sigma_x5;
%     sigma_x6 = x(i)^6 + sigma_x6;
%     sigma_x7 = x(i)^7 + sigma_x7;
%     sigma_x8 = x(i)^8 + sigma_x8;
% end
% 
% RHS = zeros();
% RHS = [sigma_y; sigma_xy; sigma_x2y; sigma_x3y; sigma_x4y];
% X = [sigma_x4 sigma_x3 sigma_x2 sigma_x length(x); sigma_x5 sigma_x4 sigma_x3 sigma_x2 sigma_x; sigma_x6 sigma_x5 sigma_x4 sigma_x3 sigma_x2; sigma_x7 sigma_x6 sigma_x5 sigma_x4 sigma_x3; sigma_x8 sigma_x7 sigma_x6 sigma_x5 sigma_x4];
% X_inv = inv(X);
% C = X_inv * RHS;
% 
% y_f = (C(1))*(x.^4) + C(2)*x.^3 + C(3)*x.^2 + C(4)*x + C(5);
% 
% hold on 
% plot(x,y_f)
