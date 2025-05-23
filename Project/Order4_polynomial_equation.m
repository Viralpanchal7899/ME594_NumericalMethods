% Program for least squares solving for a 4th order polynomial equation
% Y = Ax^4 + Bx^3 + Cx^2 + D^x + E

close all
clear all
clc

data = readtable('test.csv');

% Raw plot
% solving for velocity measured in x direction wrt time

plot(data.SampleTimeFine, data.dv_1_,'*')
grid on
axis padded
legend('raw data')

% Script for least squares parabolic equation
% Y = Ax^4 + Bx^3 + Cx^2 +Dx + E;

x = data.SampleTimeFine;
y = data.dv_1_;

sigma_x = 0;
sigma_y = 0;
sigma_xy = 0;
sigma_x2y = 0;
sigma_x3y = 0;
sigma_x4y = 0;
sigma_x2 = 0;
sigma_x3 = 0;
sigma_x4 = 0;
sigma_x5 = 0;
sigma_x6 = 0;
sigma_x7 = 0;
sigma_x8 = 0;

for i = 1:length(x)
    sigma_x = x(i) + sigma_x;
    sigma_y = y(i) + sigma_y;
    sigma_xy = x(i)*y(i) + sigma_xy;
    sigma_x2y = x(i)^2 * y(i) + sigma_x2y;
    sigma_x3y = x(i)^3 * y(i) + sigma_x3y;
    sigma_x4y = x(i)^4 * y(i) + sigma_x4y;
    sigma_x2 = x(i)^2 + sigma_x2;
    sigma_x3 = x(i)^3 + sigma_x3;
    sigma_x4 = x(i)^4 + sigma_x4;
    sigma_x5 = x(i)^5 + sigma_x5;
    sigma_x6 = x(i)^6 + sigma_x6;
    sigma_x7 = x(i)^7 + sigma_x7;
    sigma_x8 = x(i)^8 + sigma_x8;
end

RHS = zeros();
RHS = [sigma_y; sigma_xy; sigma_x2y; sigma_x3y; sigma_x4y];
X = [sigma_x4 sigma_x3 sigma_x2 sigma_x length(x); sigma_x5 sigma_x4 sigma_x3 sigma_x2 sigma_x; sigma_x6 sigma_x5 sigma_x4 sigma_x3 sigma_x2; sigma_x7 sigma_x6 sigma_x5 sigma_x4 sigma_x3; sigma_x8 sigma_x7 sigma_x6 sigma_x5 sigma_x4];
X_inv = inv(X);
C = X_inv * RHS;

y_f = (C(1))*(x.^4) + C(2)*x.^3 + C(3)*x.^2 + C(4)*x + C(5);

hold on 
plot(x,y_f)
